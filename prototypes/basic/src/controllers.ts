import { Request, Response } from "express";
import { Config } from "./config";
import { Product } from "./models";

export module Controllers {
  const config = new Config();

  export function home(_request: Request, response: Response) {
    response.render("home");
  }

  export function search(request: Request, response: Response) {
    let p: Product = {
      identifier: "1",
      name: "Forceps Reusable FRANCIS NASAL DILATOR SIZE NO414MM X 18MM",
    };

    response.render("search", {
      term: request.query["search"] || "",
      back: request.get("Referrer"),
      total: 0,
      page: 0,
      products: [p],
    });
  }

  export function detail(request: Request, response: Response) {
    response.render("detail", {
      back: request.get("Referrer"),
      product: undefined,
    });
  }
}
