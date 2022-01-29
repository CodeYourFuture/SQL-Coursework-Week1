
const express = require("express");
const { Pool } = require("pg");

const app = express();

// Specify the connection parameters in an object
const dbConfig1 = {
    host: "localhost",
    port: 5432,
    user: "tenzingeks",
    password: "",
    database: "homework",
};

// Specify the connection parameters as a connection URL
const dbConfig2 = {
    connectionString: "postgresql://szemate:abc123@localhost:5432/homework",
};

// Create a connection pool to the DB server
const pool = new Pool(dbConfig1);

const spendsSelectQuery = `SELECT date, description, amount FROM spends`;

app.get("/spends1", (req, res) =>
    // Query with callback
    pool.query(spendsSelectQuery, (error, result) => {
        if (error) {
            res.status(500).send(error);
        } else {
            res.send(result.rows);
        }
    })
);

app.get("/spends2", (req, res) =>
    // Query with promise and then/catch
    pool.query(spendsSelectQuery)
        .then(result => res.send(result.rows))
        .catch(error => res.status(500).send(error))
);

app.get("/suppliers", (req, res) => {
    const supplierQuery = `SELECT supplier FROM suppliers`;
    pool.query(supplierQuery)
    .then(result => res.send(result.rows))
    .catch(error => res.status(500).send(error))
})

app.get("/spends3", async (req, res) => {
    // Query with promise and async/await
    try {
        const result = await pool.query(spendsSelectQuery);
        res.send(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});

app.listen(3000, () => console.log("Listening on port 3000."));

