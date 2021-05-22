const express = require("express");
const {Pool} = require("pg");
const app = express();
const dbConfig = {
  host: "localhost",
  port: 5432,
  user: "DELL",
  password: "87654321",
  database: "homework",
};
const pool = new Pool(dbConfig);
const spendsSelectQuery = `SELECT date, description, amount FROM spends `;
const suppliersSelectQuery = `SELECT supplier FROM suppliers`;

app.get("/", (req, res) => {
  res.send("first page");
});

app.get("/spends1", (req, res) =>
  pool
    .query(spendsSelectQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);

app.get("/spends2", async (req, res) => {
  const result = await pool.query(spendsSelectQuery);
  res.send(result.rows);
});

app.get("/suppliers", async (req, res) => {
  const result = await pool.query(suppliersSelectQuery);

  res.send(result.rows.map((row) => row.supplier));
});

app.get("/spends3", async (req, res) => {
  const result = await pool.query(spendsSelectQuery);
  res.send(result.rows);
});

app.listen(3000, () => {
  console.log(" Server running on port 3000");
});
