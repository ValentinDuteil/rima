import jwt from "jsonwebtoken";
import { jwtConfig } from "../config/jwt.js";
import * as Errors from "../utils/errors.js";

export function requireAuth(req, res, next) {
  const token = req.cookies.token
  if (!token){
    throw new Errors.UnauthorizedError('Invalid Credentials');
  }
  try {
    const decoded = jwt.verify(token, jwtConfig.secret);
    req.user = decoded
  } catch (error) {
    throw new Errors.UnauthorizedError('Invalid Credentials');
  }
  next();
}