import mysql from "mysql"
import ENV from "../config/index.js";

const connection = mysql.createConnection({
  host: ENV.DB_HOST,
  user: ENV.DB_USER,
  password: ENV.DB_PASSWORD,
  database: ENV.DB_NAME,
  port: ENV.DB_PORT
});

connection.connect((err) => {
  if (err) {
    console.error("Error connecting to the database:", err);
  } else {
    console.log("Connected to the database!");
  }
});

export default connection;
