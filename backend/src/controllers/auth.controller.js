import * as Errors from '../utils/errors.js';
import * as authService from '../services/auth.service.js';
import { loginSchema, signupSchema } from '../middlewares/validators.js';

export async function signup(req, res) {
  const { email, password } = req.body;

  const validatedData = signupSchema.parse({ email, password });

  const existingUser = await authService.getUserByEmail(validatedData.email);
  if (existingUser) {
    throw new Errors.ConflictError('Email already in use');
  }

  const user = await authService.createUser(validatedData.email, validatedData.password);
  res.status(201).json({
    message: 'User created successfully',
    user: user
  });
};

export async function login(req, res) {
  const { email, password } = req.body;

  const validatedData = loginSchema.parse({ email, password });

  const existingUser = await authService.getUserByEmail(validatedData.email)
  if (!existingUser) {
    throw new Errors.UnauthorizedError('Invalid Credentials');
  }

  const isValid = await authService.verifyPassword(existingUser.password_hash, validatedData.password);

  if (!isValid) {
    throw new Errors.UnauthorizedError('Invalid Credentials');
  }

  const token = authService.generateToken(existingUser);

  res.cookie('token', token, {
    httpOnly: true,    // inaccessible au JS
    secure: false,     // true en production (HTTPS)
    maxAge: 7 * 24 * 60 * 60 * 1000  // 7 jours
  });

  res.status(200).json({
    message: 'Connected',
    user: {
      id: existingUser.id,
      email: existingUser.email
    }
  });
};
