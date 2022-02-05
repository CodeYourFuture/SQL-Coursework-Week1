const express = require("express");
const { Pool } = require("pg");

const app = express();

const pool = new Pool({
  host: "localhost",
  port: 5432,
  user: "georgina",
  password: "abc123",
  database: "homework",
});

const suppliersSelectQuery = `SELECT supplier FROM suppliers`;

const spendsSelectQuery = `
    SELECT expense_areas.expense_area,
           expense_types.expense_type,
           suppliers.supplier,
           spends.date,
           spends.description,
           spends.amount
    FROM spends
    INNER JOIN expense_areas ON expense_areas.id = spends.expense_area_id
    INNER JOIN expense_types ON expense_types.id = spends.expense_type_id
    INNER JOIN suppliers ON suppliers.id = spends.supplier_id;
`;

app.get("/suppliers", (req, res) =>
  pool
    .query(suppliersSelectQuery)
    .then((result) => {
      const flattenedSupplierList = result.rows.map((row) => row.supplier);
      res.send(flattenedSupplierList);
    })
    .catch((error) => res.status(500).send(error))
);

app.get("/spends", (req, res) =>
  pool
    .query(spendsSelectQuery)
    .then((result) => res.send(result.rows))
    .catch((error) => res.status(500).send(error))
);

app.listen(3000, () => console.log("Listening on port 3000."));
