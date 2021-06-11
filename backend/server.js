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

// $1- as a variable
const pool = new Pool(dbConfig);
const spendsSelectQuery = `SELECT date, description, amount FROM spends `;

const expenseAreaBYQuery = `SELECT * FROM  expense_areas`;
const expenseAreaBYIdQuery = `SELECT * FROM  expense_areas WHERE id = $1`;
const supplierBYQuery = `SELECT * FROM  suppliers`;
const supplierBYIdQuery = `SELECT * FROM suppliers WHERE id=$1`;

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

// app.get("/suppliers", async (req, res) => {
//   const result = await pool.query(suppliersSelectQuery);

//   res.send(result.rows.map((row) => row.supplier));
// });

app.get("/expenseAreas", (req, res) =>
  pool
    .query(expenseAreaBYQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);

app.get("/expenseAreas/:id", (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) {
    res.status(404).send({message: "No such expense"});
  } else {
    pool
      .query(expenseAreaBYIdQuery, [id])
      .then((result) => {
        if (result.rowCount === 0) {
          res.status(404).send({message: "No such expense"});
        } else {
          res.send(result.rows[0]);
        }
      })
      .catch((error) => res.status(500).send(error));
  }
});

app.get("/suppliers", (req, res) =>
  pool
    .query(supplierBYQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);

app.get("/suppliers/:id", function (req, res) {
  const id = parseInt(req.params.id);
  if (isNaN(id)) {
    res.status(400).send({message: "No supplier found"});
  } else {
    pool
      .query(supplierBYIdQuery, [id])
      .then((result) => {
        if (result.rowCount === 0) {
          res.status(404).send({message: "No such supplier"});
        } else {
          res.send(result.rows[0]);
        }
      })
      .catch((e) => console.error(e));
  }
});

app.listen(4000, () => {
  console.log(" Server running on port 4000");
});
