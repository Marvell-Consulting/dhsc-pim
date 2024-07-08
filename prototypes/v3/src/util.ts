import os = require("node:os");
import path = require("node:path");

export function tempFile(name: string): string {
  let dir = os.tmpdir();
  return path.join(dir, name);
}

export function slugify(name: string): string {
  if (!name) return "";

  var slug = name.toLowerCase().trim();
  slug = slug.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  slug = slug.replace(/[^a-z0-9\s-]/g, " ").trim();
  slug = slug.replace(/[\s-]+/g, "-");
  return slug;
}
