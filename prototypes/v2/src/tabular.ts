import {
  ExcelSchemaBuilder,
  ExcelSchema,
  TransformersMap,
} from "@chronicstone/typed-xlsx";

import { Product, Device } from "./models";

const excel_transformers = {
  boolean: (value: boolean) => (value ? "Yes" : "No"),
  list: (value: string[]) => value.join(", "),
  arrayLength: (value: any[]) => value.length,
  string: (value: string) => {
    if (value == null) return "";
    if (value == "NULL") return "";
    return value;
  },
} satisfies TransformersMap;

export function getCSVHeaders(): string[] {
  let p = new Product();
  let keys = new Set<string>(Object.keys(p));

  let d = new Device();
  let deviceKeys = new Set<string>(Object.keys(d));

  let s = new Set<string>([...keys, ...deviceKeys]);
  return Array.from(s.values());
}

export function getExcelSchema(): ExcelSchema<any, any, any> {
  const builder =
    ExcelSchemaBuilder.create().withTransformers(excel_transformers);

  let p = new Product();
  let keys = Object.keys(p);
  for (let key of keys) {
    builder.column(key, { key: key });
  }

  let d = new Device();
  let deviceKeys = Object.keys(d);
  for (let key of deviceKeys) {
    // Only add device keys if the value was not already added
    if (!keys.includes(key)) {
      builder.column(key, { key: key, transform: "string" });
    }
  }

  return builder.build();
}
