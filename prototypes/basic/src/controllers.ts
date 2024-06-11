import { Request, Response } from "express";

export module Controllers {
  export function index(_request: Request, response: Response) {
    response.render("index");
  }
}
