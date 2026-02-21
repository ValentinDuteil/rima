import verbsRoutes from './verbs.routes.js';
import { Router } from 'express';

const router = Router();

router.use('/verbs', verbsRoutes);

export default router;