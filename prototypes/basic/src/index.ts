import express, { Express } from "express";

import mustacheExpress from "mustache-express";
import bodyParser from "body-parser";

import { Config } from "./config";
import { Controllers } from "./controllers";

const config = new Config();
const app: Express = express();

// Configure templating for controllers
app.set("views", `templates`);
app.set("view engine", "mustache");
app.engine("mustache", mustacheExpress());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", Controllers.index);
app.use(express.static("static"));

app.listen(config.port, config.host, () => {
  console.log(
    `[server]: Server is running at http://${config.host}:${config.port}`,
  );
});
