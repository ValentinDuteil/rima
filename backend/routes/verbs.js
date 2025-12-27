import { Router } from 'express';
import { getAllVerbs, getVerbById, searchVerbs } from '../controllers/verbsController.js';

const router = Router();

router.get('/', getAllVerbs);
router.get('/search', searchVerbs)
router.get('/:id', getVerbById);

export default router;