import verbsRoutes from './verbs.js';
import { Router } from 'express';

const router = Router();

router.use('/verbs', verbsRoutes);

export default router;