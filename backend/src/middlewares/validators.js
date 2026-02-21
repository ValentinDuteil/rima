import { z } from 'zod';

const messageError = "Votre mot de passe doit contenir au moins 8 caractères, une majuscule, et un caractère spécial"
const messageErrorEmpty = "Les champs ne peuvent pas être vides"

export const signupSchema = z.object({
  email: z.email(),
  password: z.string()
    .min(8, messageError)
    .regex(/[A-Z]/, messageError)
    .regex(/[!@#$%^&*]/, messageError)
});

export const loginSchema = z.object({
  email: z.email(),
  password: z.string()
    .min(1, messageErrorEmpty)
});