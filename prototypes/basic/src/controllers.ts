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
        "select rank, device_id from search where search match ? order by rank LIMIT ? OFFSET ?;";
      let countQuery =
        "select count(device_id) as total from search where search match ?";
      let idResults = db.prepare(query).all(term, limit, offset);

      if (idResults.length > 0) {
        let ids: number[] = idResults.map((d: any) => {
          return d.DEVICE_ID;
        });
        query = getByIds(ids);
        console.log(query);

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
      `SELECT D.*, O.MAN_ORGANISATION_NAME FROM devices AS D
     JOIN organisations O on D.MAN_ORGANISATION_ID=O.MAN_ORGANISATION_ID
     ORDER BY D.DEVICE_TYPE_NAME
     LIMIT ?
     OFFSET ?`,
      `SELECT COUNT(*) as total FROM devices`,
    ];
  }

  function getByIds(ids: number[]): string {
    var inExpression = ids.join(",");

    return `SELECT D.*, O.MAN_ORGANISATION_NAME FROM devices AS D
     JOIN organisations O on D.MAN_ORGANISATION_ID=O.MAN_ORGANISATION_ID
     WHERE D.DEVICE_ID IN (${inExpression})`;
  }

  export function detail(request: Request, response: Response) {
    let query = `SELECT D.*, O.MAN_ORGANISATION_NAME FROM devices AS D
     JOIN organisations O on D.MAN_ORGANISATION_ID=O.MAN_ORGANISATION_ID
     WHERE D.DEVICE_ID = ?`;

    let db = request.app.get("db");
    let product = db.prepare(query).get(request.params.id);

    let manufacturer = db
      .prepare(`select * from organisations where MAN_ORGANISATION_ID=?`)
      .get(product.MAN_ORGANISATION_ID);

    response.render("detail", {
      back: request.get("Referrer"),
      product: product,
      manufacturer: manufacturer,
    });
  }
}
