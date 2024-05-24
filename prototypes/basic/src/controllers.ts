import { Request, Response } from "express";
//import { Config } from "./config";
import { PARDProduct } from "./models";

export module Controllers {
  // const config = new Config();

  export function home(_request: Request, response: Response) {
    response.render("home");
  }

  export function search(request: Request, response: Response) {
    let term: string = request.query.search?.toString() || "";
    let page = parseInt(request.query.page?.toString() || "1");
    let limit = 10;
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
      let query =
        "select rank, PRODUCT_ID from search where search match ? order by rank LIMIT ? OFFSET ?;";
      let countQuery =
        "select count(PRODUCT_ID) as total from search where search match ?";
      let idResults = db.prepare(query).all(term, limit, offset);

      if (idResults.length > 0) {
        let ids: number[] = idResults.map((d: any) => {
          return d.PRODUCT_ID;
        });
        query = getByIds(ids);

        products = db.prepare(query).all();
        total = db.prepare(countQuery).get(term).total;
      }
    }

    if (products.length > 0) {
      rangeText = `${offset + 1} - ${offset + products.length}`;
    }

    response.render("search", {
      term: request.query["search"] || "",
      back: request.get("Referrer"),
      total: total,
      page: offset,
      rangeText: rangeText,
      products: products,
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

    response.render("detail", {
      back: request.get("Referrer"),
      product: product,
      manufacturer: manufacturer,
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
