import express from "express";
import ENV from "./config/index.js";
import accountRouter from "./router/account.js";
import donationRouter from "./router/donation.js";
import categoryRouter from "./router/category.js";
import sedekahRouter from "./router/sedekah.js";
import menuRouter from "./router/menu.js";
import cors from "cors";


const app = express()
app.use(cors());
app.use(express.json());

app.use(express.static('public'));

app.get("/healty", (request, response) => {
    return response.status(200).json({
        "message": "Hello"
    })
})


app.use("/api/v1", accountRouter);
app.use("/api/v1/donation", donationRouter);
app.use("/api/v1/category", categoryRouter);
app.use("/api/v1/sedekah", sedekahRouter);
app.use("/api/v1/menu", menuRouter);

app.listen(ENV.PORT,() => {
    console.log(`running server http://localhost:${ENV.PORT}`)
})