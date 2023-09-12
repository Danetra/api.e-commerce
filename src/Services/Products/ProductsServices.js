require("dotenv").config();
const jwt = require("jsonwebtoken");
const axios = require("axios");
const db = require("../../Databases/database");
const moment = require("moment");

const JWT_KEY = process.env.JWT_KEY;

const ListServices = async (req) => {
  try {
    // console.log(req);
    let data;
    let page = req.query.page;
    let limit = req.query.limit;
    let offset = (page - 1) * limit;
    let query = `SELECT a."namaProduk", a."ratingProduk", a.deskripsi, a.harga, a.stok, a."gambarProduk", b."namaToko" FROM products as a INNER JOIN users as b ON a."userId" = b.id INNER JOIN jenis as c ON a."jenisProduk" = c.id LIMIT ${limit} OFFSET ${offset}`;

    let response = await db.query(query);
    console.log(response);

    let totalDocs = response.rowCount;
    let totalPages = Math.ceil(totalDocs / limit);
    // console.log(count);

    if (totalDocs > 0) {
      data = {
        status: 200,
        data: {
          docs: response.rows,
          page: page,
          limit: limit,
          totalDocs: totalDocs,
          totalPages: totalPages
        }
      };
    } else {
      data = {
        status: 404,
        message: "Product's Empty",
        data: {
          docs: response.rows,
          page: page,
          limit: limit,
          totalDocs: totalDocs,
          totalPages: totalPages
        }
      };
    }
    console.log(data);
    return data;
  } catch (error) {
    console.log(error);
  }
};

const DetailServices = async (req) => {
  try {
    let userId = req.params.id;
    console.log(userId);
    let query = `SELECT a."namaProduk", a."ratingProduk", a.deskripsi, a.harga, a.stok, a."gambarProduk", b."namaDepan", b."namaBelakang", b."namaToko", c.nama as jenisProduk FROM products as a INNER JOIN users as b ON a."userId" = b.id INNER JOIN jenis as c ON a."jenisProduk" = c.id WHERE a.id = $1`;
    let values = [userId];

    let response = await db.query(query, values);
    return response.rows[0];
  } catch (error) {
    console.log(error);
  }
};

module.exports = { ListServices, DetailServices };
