import express from "express";
import connection from "../database/connection.js";
import multerUpload from "../util/upload.js";
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

        const sql = `SELECT * FROM donations WHERE title LIKE ${sanitizedTitle} LIMIT ${itemsPerPage} OFFSET ${offset}`;
        const countQuery = `SELECT COUNT(*) AS sumRow FROM donations WHERE title LIKE ${sanitizedTitle}`;
        connection.query(sql, function (err, results) {
            if (err) {
                return responseHandler(res, { data: [], message: err, status: INTERNAL_SERVER_ERROR });
            }
            const modifiedResults = results.map(result => ({
                id: result.id,
                title: result.title,
                image: `http://localhost:3000/images/${result.image}`,
                description: result.description,
                status: result.status,
                created_at: result.created_at,
                category_id: result.category_id
            }));

            connection.query(countQuery, function (countErr, countResults) {
                if (countErr) {
                    return responseHandler(res, { data: [], message: countErr, status: INTERNAL_SERVER_ERROR });
                }

                const totalCount = countResults[0].sumRow;

                return responseHandler(res, { data: modifiedResults, message: "data found", status: OK, rows: totalCount });
            });
        });
    } catch (e) {
        return responseHandler(res, { data: err, message: "error", status: INTERNAL_SERVER_ERROR })
    }
});

router.post("/", multerUpload.single("file"), async (req, res) => {
    const { title, description, status, categoryId } = req.body;

    try {
        if (!req.file) {
            throw new Error("No file uploaded");
        }

        const sql = "INSERT INTO donations (id, title, image, description, status, category_id) VALUES(?, ?, ?, ?, ?, ?)";
        const params = [uuidv4(), title, req.file.filename, description, status, categoryId];

        await executeQuery(sql, params);

        return responseHandler(res, { data: [], message: "donation uploaded successfully", status: OK });
    } catch (error) {
        return responseHandler(res, { data: error.message, message: "Error", status: INTERNAL_SERVER_ERROR });
    }
});

async function executeQuery(query, params) {
    return new Promise((resolve, reject) => {
        connection.query(query, params, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
}

export default router;