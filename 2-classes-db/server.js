const express = require("express");
const { Pool } = require("pg");
const app = express();

const dbConfig = {
    host: "localhost",
    port: 5432,
    user: "jas",
    password: "",
    database: "homework",
};
const pool = new Pool(dbConfig);
const spendsSelectQuery = `SELECT date, description, amount FROM spends`;
app.get("/spends", (req, res) =>
    pool.query(spendsSelectQuery, (error, result) => {
        if (error) {
            res.status(500).send(error);
        } else {
            res.send(result.rows);
        }
    })
);
app.get("/spends2", (req, res) =>
    pool.query(spendsSelectQuery)
        .then(result => res.send(result.rows))
        .catch(error => res.status(500).send(error))
);
app.get("/spends3", async (req, res) => {
    try {
        const result = await pool.query(spendsSelectQuery);
        res.send(result.rows);
    } catch (error) {
        res.status(500).send(error);
    }
});
app.listen(3000, () => console.log("Running on port 3000"));