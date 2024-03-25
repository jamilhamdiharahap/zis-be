import express from "express";
import connection from "../database/connection.js";
import ENV from "../config/index.js";
import { responseHandler } from "../helper/responseHelper.js";
import { INTERNAL_SERVER_ERROR, NOTFOUND, OK } from "../constant/status.js";
import { v4 as uuidv4 } from 'uuid';

const router = express.Router();

router.get("/", (req, res) => {
    try {
        const sanitizedTitle = connection.escape(`%${req.query.title}%`);
        const sql = `SELECT * FROM categories WHERE name LIKE ${sanitizedTitle} `;
        connection.query(sql, function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }
            return responseHandler(res, { data: results, message: "data found", status: OK });
        })
    } catch (e) {
        return responseHandler(res, { data: err, message: "error", status: INTERNAL_SERVER_ERROR })
    }
});


function insertCategory(id, name) {
    const insertQuery = "INSERT INTO categories (id, name) VALUES (?, ?)";
    connection.query(insertQuery, [id, name]);
}

router.post("/", (req, res) => {
    const { name } = req.body;
    try {
        const checkQuery = "SELECT * FROM categories WHERE name = ?";

        connection.query(checkQuery, name, async function (error, result) {
            if (result.length > 0) {
                return responseHandler(res, { data: [], message: "Category already registered", status: OK });
            }
            const categoryId = uuidv4();
            insertCategory(categoryId, name.toUpperCase());

            return responseHandler(res, { data: [], message: "Category registered successfully", status: OK });
        });
    } catch (error) {
        return responseHandler(res, { data: error, message: "Error", status: INTERNAL_SERVER_ERROR });
    }
});

export default router;