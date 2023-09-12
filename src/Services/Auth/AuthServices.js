require("dotenv").config();
const db = require("../../Databases/database");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const moment = require("moment");

const JWT_KEY = process.env.JWT_KEY;

const loginService = async (request) => {
  let email = request.email;
  let password = request.password;
  let { user, count } = await getUser(email);
  let token = "";
  if (count === 1) {
    if (await bcrypt.compare(password, user.password)) {
      token = generateToken(user);

      return token;
    } else {
      return 400;
    }
  } else {
    return 404;
  }
};

const registerService = async (request) => {
  console.log(db);
  let email = request.email;
  let response;

  let { count } = await getUser(email);
  if (count === 1) {
    response = {
      code: 401,
      status: false,
      message: "Email is used with other account"
    };
  } else if (request.password !== request.confirmPassword) {
    response = {
      code: 400,
      status: false,
      message: "Password is not match"
    };
  } else {
    let password = await bcrypt.hash(request.password, 10);
    let query = `INSERT INTO users ("namaDepan", "namaBelakang", "namaToko", "noTelp", "roleId", email, password, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)`;

    let data = [
      request.namaDepan,
      request.namaBelakang,
      request.namaToko,
      request.noTelp,
      3,
      request.email,
      password,
      moment().format("YYYY-MM-DD HH:mm:ss"),
      moment().format("YYYY-MM-DD HH:mm:ss")
    ];

    console.log(query);
    console.log(data);

    await db.query(query, data);

    response = {
      code: 200,
      status: true,
      message: "Success inserted",
      data: {
        namaLengkap: `${request.namaDepan} ${
          request.namaBelakang ? request.namaBelakang : ""
        }`
      }
    };
  }
  return response;
};

const getUser = async (email) => {
  var result = await db.query(`SELECT * FROM users where email = $1`, [email]);
  return { user: result.rows[0], count: result.rowCount };
};

const generateToken = (user, time = 3600 * 2) => {
  let namaDepan = Buffer.from(user.namaDepan).toString("base64");
  return jwt.sign(
    {
      id: user.id,
      namaDepan: namaDepan
    },
    JWT_KEY,
    { expiresIn: time }
  );
};

module.exports = { loginService, registerService };
