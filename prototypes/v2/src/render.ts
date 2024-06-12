import { slugify, tempFile } from "./util";
import { Response } from "express";
import { ExcelBuilder } from "@chronicstone/typed-xlsx";
import { getCSVHeaders, getExcelSchema } from "./tabular";
import * as fs from "node:fs";

export enum RenderTarget {
  HTML = "html",
  EXCEL = "xls",
  CSV = "csv",
}

export function parseFmt(tgt: string): RenderTarget {
  let key = tgt.toUpperCase();
  let rt = RenderTarget[key as keyof typeof RenderTarget];

  if (rt) return rt;
  return RenderTarget.HTML;
}

type Renderer = (object: any) => void;

export function getRenderer(
  fmt: RenderTarget,
  view: string,
  response: Response,
): Renderer {
  switch (fmt) {
    case RenderTarget.EXCEL:
      return _renderXLS(response);
    case RenderTarget.CSV:
      return _renderCSV(response);
    default:
      return _renderHTML(view, response);
  }
}

function _renderHTML(template: string, response: Response): Renderer {
  return (object: any) => {
    response.render(template, object);
  };
}

function _renderXLS(response: Response): Renderer {
  return (object: any) => {
    // We shouldn't get here if there's no data to show
    if (object.total == 0) return;

    let document = ExcelBuilder.create()
      .sheet(`Products - ${object.term}`)
      .addTable({
        data: object.products,
        schema: getExcelSchema(),
      })
      .build({ output: "buffer" });

    let slug = slugify(object.term);
    let filename = tempFile(`search-results-${slug}.xlsx`);
    fs.writeFileSync(filename, document);
    response.contentType(
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    );
    response.download(filename);
  };
}

function _renderCSV(response: Response): Renderer {
  return (object: any) => {
    // We shouldn't get here if there's no data to show
    if (object.total == 0) return;

    let slug = slugify(object.term);
    let filename = tempFile(`search-results-${slug}.csv`);

    let fd = fs.openSync(filename, "w");

    let headers = getCSVHeaders();
    fs.writeSync(fd, headers.join(",") + "\n");

    object.products.map((product: any) => {
      let row = headers.map((key) => {
        let cell =
          product[key] === null || product[key] === undefined
            ? ""
            : product[key];

        if (typeof cell == "string") {
          if (cell == "NULL") {
            cell = "";
          }

          if (cell.search(/("|,|\n)/g) >= 0) {
            cell = `"${cell}"`;
          }
        }

        return cell;
      });

      fs.writeSync(fd, row.join(",") + "\n");
    });

    fs.closeSync(fd);

    response.contentType("text/csv; charset=UTF-8");
    response.download(filename);
  };
}
