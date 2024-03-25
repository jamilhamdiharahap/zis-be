import jwt from "jsonwebtoken"
import ENV from "../config/index.js";

export function createToken(data) {
    return jwt.sign(data, ENV.SECRET_KEY);
}

export function authToken(token) {
    return authProtocol(token, 3600 * 24 * 7, ENV.SECRET_KEY)
}