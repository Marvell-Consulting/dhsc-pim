import { Request, Response } from "express";
import { Config } from "./config";

export module Controllers {
  const config = new Config();

  export function home(_request: Request, response: Response) {
    response.render("home");
  }

  export function search(request: Request, response: Response) {
    let page = parseInt(request.query.page?.toString() || "1");
    let limit = 10;
    let offset = (page - 1) * limit;

    let db = request.app.get("db");
    let query = `SELECT D.*, O.MAN_ORGANISATION_NAME FROM devices AS D
     JOIN organisations O on D.MAN_ORGANISATION_ID=O.MAN_ORGANISATION_ID
     ORDER BY D.DEVICE_TYPE_NAME
     LIMIT ?
     OFFSET ?`;
    let rows = db.prepare(query).all(limit, offset);

    let countQuery = `SELECT COUNT(*) as total FROM devices`;
    let total = db.prepare(countQuery).get().total;
    let rangeText = `${offset + 1} - ${offset + rows.length}`;

    response.render("search", {
      term: request.query["search"] || "",
      back: request.get("Referrer"),
      total: total,
      page: offset,
      rangeText: rangeText,
      products: rows,
    });
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
