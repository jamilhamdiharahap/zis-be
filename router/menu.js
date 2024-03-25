import express from "express";
import connection from "../database/connection.js";
import ENV from "../config/index.js";
import { responseHandler } from "../helper/responseHelper.js";
import { INTERNAL_SERVER_ERROR, NOTFOUND, OK } from "../constant/status.js";
import { v4 as uuidv4 } from 'uuid';

const router = express.Router();

router.get("/", (req, res) => {
    const { roleId } = req.query
    try {
        const sql = `SELECT * FROM menus WHERE role_id = ? ORDER BY created_at ASC`;
        connection.query(sql, [roleId], function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }
            return responseHandler(res, { data: results, message: "data found", status: OK });
        })
    } catch (e) {
        return responseHandler(res, { data: err, message: "error", status: INTERNAL_SERVER_ERROR })
    }
});

router.get("/id", (_, res) => {
    const zisId = uuidv4();
    return responseHandler(res, { data: zisId, message: "data found", status: OK });

});

export default router;