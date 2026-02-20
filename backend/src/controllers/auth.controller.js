import * as Errors from '../utils/errors.js';
import * as authService from '../services/auth.service.js';
import { signupSchema } from '../middlewares/validators.js';

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
}
