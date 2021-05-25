const express = require("express");
const { Pool } = require("pg");
const app = express();
const dbConfig = {
  host: "localhost",
  port: 5432,
  user: "cyf", // when run locally, input your own user name here
  password: "C0d3Y0urFutur3", // input your computer password
  database: "homework",
};
const pool = new Pool(dbConfig);

// Exercise 3
// Create a GET /spends endpoint that returns the list of all spends
// as a JSON array of objects. Each object should contain the date,
// description and amount properties.
const spendsSelectQuery = `SELECT date, description, amount FROM spends`;
// method 1
app.get("/spends", (req, res) =>
  pool.query(spendsSelectQuery, (error, result) => {
    if (error) {
      res.status(500).send(error);
    } else {
      res.send(result.rows);
    }
  })
);
// method 2
app.get("/spends2", (req, res) =>
  pool
    .query(spendsSelectQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);
// method 3
app.get("/spends3", async (req, res) => {
  try {
    const result = await pool.query(spendsSelectQuery);
    res.send(result.rows);
  } catch (error) {
    res.status(500).send(error);
  }
});

// Exercise 4
// Create a GET /suppliers endpoint that returns the list
// of the names of all suppliers as a JSON array of strings.
// Make sure the response is an array of strings and not an
// array of objects!
const suppliersSelectQuery = `SELECT supplier FROM suppliers`;
app.get("/suppliers", (req, res) =>
  pool
    .query(suppliersSelectQuery)
    // .then((result) => {
    //   const rows = result.rows;
    //   const supplierName = rows.map((row) => {
    //     return row.supplier;
    //   });
    //   res.send(supplierName);
    // })
    .then((result) => {
      const supplierName = result.rows.map((row) => row.supplier);
      res.send(supplierName);
    })
    .catch((error) => res.status(500).send(error))
);

// Exercise 5
// Extend the GET /spends endpont to return a more
// compete list of spends. Each object should contain
// the expense_area, expense_type, supplier, date,
// description and amount properties. The objects should not
// include any IDs, that is, the tables should be joined together.
const spendsDetailSelectQuery = `
SELECT c.expense_area,
    d.expense_type,
    b.supplier,
    a.date,
    a.description,
    a.amount
FROM spends AS a
    INNER JOIN suppliers AS b ON b.id = a.supplier_id
    INNER JOIN expense_areas AS c ON c.id = a.expense_area_id
    INNER JOIN expense_types AS d ON d.id = a.expense_type_id;
`;

app.get("/spends2/detail", (req, res) =>
  pool
    .query(spendsDetailSelectQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);

app.listen(3000, () => console.log("Running on port 3000"));
