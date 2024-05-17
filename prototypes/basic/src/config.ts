import dotenv from "dotenv";

export class Config {
  port: number = 3000;
  host: string = "0.0.0.0";

  auth_username: string = "";
  auth_password: string = "";

  constructor() {
    dotenv.config();

    const portString: string = process.env.PORT || String(this.port);
    this.port = parseInt(portString);
    this.host = process.env.HOST || this.host;
    this.auth_username = process.env.AUTH_USERNAME || "";
    this.auth_password = process.env.AUTH_PASSWORD || "";
  }
}
