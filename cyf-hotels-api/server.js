const express = require("express");
const app = express();

app.use = express();

app.listen(3000, function () {
  console.log("Server is listening on port 3000. Ready to accept requests!");
});

const { Pool } = require("pg");
//Pool connection database
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cyf_hotels",
  password: "CYFStudent123",
  port: 5432,
});

app.get("/bookings/today", function (req, res) {
  const { id } = req.params;
  pool
    // .query('SELECT * FROM bookings WHERE customer_id > $1', ['2000-01-01'])
     .query('SELECT * FROM bookings')
    .then((result) => {
      return res.json(result.rows);
    })
    .catch((error) => {
      console.error(error);
      res.status(500).json(error);
    });
});

app.get("/bookings/:id", function (req, res) {
  
  const { id } = req.params;
  pool
    .query("SELECT * FROM bookings WHERE customer_id = $1", [id])
    .then((result) => {
      return res.json(result.rows);
    })
    .catch((error) => {
      console.error(error);
      res.status(500).json(error);
    });
});
