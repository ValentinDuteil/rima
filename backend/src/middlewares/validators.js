import { z } from 'zod';

const messageError = "Votre mot de passe doit contenir au moins 8 caractères, une majuscule, et un caractère spécial"

export const signupSchema = z.object({
  email: z.string().email(),
  password: z.string()
    .min(8, messageError)
    .regex(/[A-Z]/, messageError)
    .regex(/[!@#$%^&*]/, messageError)
});