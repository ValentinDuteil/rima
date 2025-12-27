import { Router } from 'express';
import { getAllVerbs, getVerbById } from '../controllers/verbsController.js';

const router = Router();

router.get('/', getAllVerbs);
router.get('/:id', getVerbById);

export default router;