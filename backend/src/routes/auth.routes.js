import express from 'express';
import { asyncHandler } from '../utils/asyncHandler.js';
import * as authController from '../controllers/auth.controller.js';

const router = express.Router();

router.post('/signup', asyncHandler(authController.signup));

export default router;