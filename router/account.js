import express from "express";
import connection from "../database/connection.js";
import CryptoJS from "crypto-js";
import ENV from "../config/index.js";
import { responseHandler } from "../helper/responseHelper.js";
import { INTERNAL_SERVER_ERROR, NOTFOUND, OK } from "../constant/status.js";
import { v4 as uuidv4 } from 'uuid';
import { createToken } from "../util/authToken.js";

const router = express.Router();

router.post("/login", (req, res) => {
    const { username, password } = req.body
    try {
        const sqlCheckAccount = `SELECT a.*, b.id as role_id, b.status FROM accounts a INNER JOIN roles b ON a.role_id = b.id WHERE username = ? OR email = ?`;
        connection.query(sqlCheckAccount, [username, username], function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }

            if (results.length === 0) {
                return responseHandler(res, { data: [], message: "username not found", status: NOTFOUND });
            }

            const comparePassword = CryptoJS.AES.decrypt(results[0].password, ENV.HASH_KEY).toString(CryptoJS.enc.Utf8);
            if (password == comparePassword) {
                const values = {
                    id: results[0].id,
                    name: results[0].name,
                    username: results[0].username,
                    roleId: results[0].role_id,
                    roleName: results[0].status
                }

                const token = createToken(values)
                return responseHandler(res, { data: values, message: "successfully logged in", status: OK, token: token });
            }
            return responseHandler(res, { data: [], message: "wrong password", status: NOTFOUND });
        });
    } catch (err) {
        return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR })
    }
});

router.post("/register", (req, res) => {
    const { name, username, email, password } = req.body
    try {
        const sqlCheckAccount = `SELECT * FROM accounts WHERE username = ? OR email = ?`;
        connection.query(sqlCheckAccount, [username, email], function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }

            if (results.length > 0) {
                return responseHandler(res, { data: [], message: "username or email already registered", status: OK });
            }

            const hashPassword = CryptoJS.AES.encrypt(password, ENV.HASH_KEY).toString();

            const sql = `INSERT INTO accounts (id, name, username, email, password, role_id) VALUES(?, ?, ?, ?, ?, ?)`;
            const params = [uuidv4(), name, username, email, hashPassword, "31c1b17a-100f-4bbb-968b-bde89ca69db5"];
            connection.query(sql, params, function (err, result) {
                if (err) {
                    return responseHandler(res, { data: [], message: err, status: OK });
                }
                return responseHandler(res, { data: [], message: "registration successfully", status: OK });
            });
        });
    } catch (err) {
        return responseHandler(res, { data: err, message: "OK", status: INTERNAL_SERVER_ERROR })
    }
});


export default router;