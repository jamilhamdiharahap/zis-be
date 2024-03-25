import dotenv from "dotenv"
dotenv.config()

const ENV = {
    // database
    PORT: process.env.PORT,
    DB_NAME: process.env.DB_NAME,
    DB_HOST: process.env.DB_HOST,
    DB_USER: process.env.DB_USER,
    DB_PASSWORD: process.env.DB_PASSWORD,
    DB_PORT: process.env.DB_PORT,
    // cryptoJS
    HASH_KEY: process.env.HASH_KEY,
    // jwt
    SECRET_KEY: process.env.SECRET_KEY
}

export default ENV
