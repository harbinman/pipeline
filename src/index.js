// index.js 文件
const express = require("express");
const app = express();
const port = 3000;
const { executeQuery } = require("./dbconnection/mysql");

app.get("/", (req, res) => {
  executeQuery("SELECT * FROM test", (err, rows) => {
    if (err) {
      res.status(500).send("Database error: " + err.message);
      return;
    }
    res.send("The rows are: " + JSON.stringify(rows));
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
