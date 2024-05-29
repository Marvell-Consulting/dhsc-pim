import { Request, Response } from "express";
//import { Config } from "./config";
import { PARDProduct } from "./models";
import { pagination } from "./pagination";

const PAGE_SIZE: number = 10;

export module Controllers {
  // const config = new Config();

  export function index(_request: Request, response: Response) {
    response.render("index");
  }

  export function home(_request: Request, response: Response) {
    response.render("home");
  }

  export function wound(_request: Request, response: Response) {
    response.render("wound");
  }

  export function paq(_request: Request, response: Response) {
    response.render("paq");
  }

  export function paq2(_request: Request, response: Response) {
    response.render("paq2");
  }

  export function multiple(_request: Request, response: Response) {
    response.render("multiple");
  }

  export function multipleresults(_request: Request, response: Response) {
    response.render("multipleresults");
  }

  export function search(request: Request, response: Response) {
    let term: string = request.query.search?.toString() || "";
    let page = parseInt(request.query.page?.toString() || "1");
    let limit = PAGE_SIZE;
    let offset = (page - 1) * limit;

    let db = request.app.get("db");

    let rangeText = "";
    let total = 0;
    let products: PARDProduct[] = [];

    if (term.trim().length == 0) {
      let [query, countQuery] = browseQuery();
      products = db.prepare(query).all(limit, offset);
      total = db.prepare(countQuery).get().total;
    } else {
      let qterm = removePunctuation(term);

      let query =
        "select rank, PRODUCT_ID from search where search match ? order by rank LIMIT ? OFFSET ?;";
      let countQuery =
        "select count(PRODUCT_ID) as total from search where search match ?";
      let idResults = db.prepare(query).all(qterm, limit, offset);

      if (idResults.length > 0) {
        let ids: number[] = idResults.map((d: any) => {
          return d.PRODUCT_ID;
        });
        query = getByIds(ids);

        products = db.prepare(query).all();
        total = db.prepare(countQuery).get(qterm).total;
      }
    }

    if (products.length > 0) {
      rangeText = `${offset + 1} - ${offset + products.length}`;
    }

    let fullURL = `${request.protocol}://${request.get("host")}${request.originalUrl}`;

    let total_pages = Math.floor(total / PAGE_SIZE) + 1;
    let pages = pagination(fullURL, page, total_pages);

    let has_previous_page: string = "";
    let has_next_page: string = "";
    if (total_pages > 1) {
      if (page != 1) {
        let pageURL = new URL(fullURL);
        pageURL.searchParams.delete("page");
        pageURL.searchParams.set("page", (page - 1).toString());
        has_previous_page = pageURL.toString();
      }

      if (page != total_pages) {
        let pageURL = new URL(fullURL);
        pageURL.searchParams.delete("page");
        pageURL.searchParams.set("page", (page + 1).toString());
        has_next_page = pageURL.toString();
      }
    }

    response.render("search", {
      term: request.query["search"] || "",
      back: request.get("Referrer"),
      total: total,
      page: offset,
      rangeText: rangeText,
      products: products,
      has_previous_page: has_previous_page,
      has_next_page: has_next_page,
      pages: pages,
    });
  }

  function browseQuery(): [string, string] {
    return [
      `SELECT P.*, D.* FROM products AS P INNER JOIN devices as D ON D.DEVICE_ID=P.DEVICE_ID  ORDER BY P.BRAND_TRADE_NAME
     LIMIT ? OFFSET ?`,
      `SELECT COUNT(*) as total FROM products`,
    ];
  }

  function getByIds(ids: number[]): string {
    var inExpression = ids.join(",");

    return `SELECT P.*,D.* FROM products as P INNER JOIN devices as D ON D.DEVICE_ID=P.DEVICE_ID WHERE PRODUCT_ID IN (${inExpression})`;
  }

  export function detail(request: Request, response: Response) {
    let query = `SELECT P.*, D.* FROM products AS P INNER JOIN devices as D ON D.DEVICE_ID=P.DEVICE_ID WHERE PRODUCT_ID = ?`;

    let db = request.app.get("db");
    let product = db.prepare(query).get(request.params.id);

    let manufacturer = db
      .prepare(`select * from organisations where MAN_ORGANISATION_ID=?`)
      .get(product.MANUFACTURER_ID);

    // Cleanup product
    product.UNIT_OF_USE_UDI_DI = clean_boolean(product.UNIT_OF_USE_UDI_DI);
    product.SINGLE_USE_DEVICE = clean_boolean(product.SINGLE_USE_DEVICE);
    product.IS_STERILE = clean_boolean(product.IS_STERILE);
    product.DEVICE_IMPLANTABLE = clean_boolean(product.DEVICE_IMPLANTABLE);
    product.IS_CONTAINING_LATEX = clean_boolean(product.IS_CONTAINING_LATEX);

    // Fudge to make the product code available in the manufacturer template
    if (manufacturer) {
      manufacturer.PRODUCT_CODE = product.PRODUCT_CODE;
    }

    let debug = request.query.debug || "";
    if (debug) {
      debug = product;
    }

    response.render("detail", {
      back: request.get("Referrer"),
      product: product,
      manufacturer: manufacturer,
      debug: debug,
    });
  }
}

function clean_boolean(val?: string | undefined): string {
  if (val === null || val === undefined || val == "" || val == "NULL") {
    return "Not specified";
  }

  if (val === "0") {
    return "No";
  } else if (val === "1") {
    return "Yes";
  } else if (val.toLowerCase() === "na") {
    return "Not applicable";
  }

  return val;
}

function removePunctuation(text: string): string {
  return text.replace(/[^\w\s]|_/g, "");
}
