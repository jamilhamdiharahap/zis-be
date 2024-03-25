import express from "express";
import connection from "../database/connection.js";
import ENV from "../config/index.js";
import { responseHandler } from "../helper/responseHelper.js";
import { INTERNAL_SERVER_ERROR, NOTFOUND, OK } from "../constant/status.js";
import { v4 as uuidv4 } from 'uuid';

const router = express.Router();

router.get("/", (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const itemsPerPage = 5;
        const offset = (page - 1) * itemsPerPage;

        const sanitizedTitle = connection.escape(`%${req.query.title}%`);

        const sql = `SELECT * FROM zis WHERE message LIKE ${sanitizedTitle} LIMIT ${itemsPerPage} OFFSET ${offset}`;
        const countQuery = "SELECT COUNT(*) AS sumRow FROM zis";

        connection.query(sql, function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }

            connection.query(countQuery, function (countErr, countResults) {
                if (countErr) {
                    return responseHandler(res, { data: [], message: countErr, status: INTERNAL_SERVER_ERROR });
                }

                const totalCount = countResults[0].sumRow;

                return responseHandler(res, { data: results, message: "data found", status: OK, rows: totalCount });
            });
        });
    } catch (e) {
        return responseHandler(res, { data: err, message: "error", status: INTERNAL_SERVER_ERROR })
    }
});

router.get("/id", (_, res) => {
    const zisId = uuidv4();
    return responseHandler(res, { data: zisId, message: "data found", status: OK });

});


router.post("/", (req, res) => {
    const { message, total_zis, account_id } = req.body;
    try {
        const zisId = uuidv4();
        const checkQuery = "INSERT INTO zis (id, message, total_zis, account_id) VALUES (?, ?, ?, ?)";
        const params = [zisId, message, total_zis, account_id];
        connection.query(checkQuery, params, function (error, result) {
            if (error) {
                return responseHandler(res, { data: [], message: error.message, status: INTERNAL_SERVER_ERROR });
            }
            return responseHandler(res, { data: [], message: "Terimakasih, semoga allah SWT membalas kebaikannya", status: OK });
        });
    } catch (error) {
        return responseHandler(res, { data: error, message: "Error", status: INTERNAL_SERVER_ERROR });
    }
});

export default router;