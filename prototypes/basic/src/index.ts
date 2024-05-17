import express, { Express, Request, Response } from "express";
import basicAuth from "express-basic-auth";

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

// If we have configured a username and password for basic auth, then ensure
// they are valid to authorize users.
if (config.auth_username.length > 0 && config.auth_password.length > 0) {
  function authorizer(username: string, password: string): boolean {
    const userMatches = basicAuth.safeCompare(username, config.auth_username);
    const passwordMatches = basicAuth.safeCompare(
      password,
      config.auth_password,
    );

    console.log("Checking details");

    return userMatches && passwordMatches;
  }

  console.log("Adding authorizer");
  app.use(
    basicAuth({
      authorizer: authorizer,
      challenge: true,
      realm: "prototype",
    }),
  );
}

// Set up routes for controllers
app.get("/", Controllers.home);
app.get("/search", Controllers.search);
app.get("/product/:id", Controllers.detail);

app.use(express.static("static"));

app.listen(config.port, config.host, () => {
  console.log(
    `[server]: Server is running at http://${config.host}:${config.port}`,
  );
});
