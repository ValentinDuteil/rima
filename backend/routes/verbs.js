import { Router } from 'express';
import { getAllVerbs, getVerbById, searchVerbs, getVerbConjugations } from '../controllers/verbsController.js';

const router = Router();

router.get('/', getAllVerbs);
router.get('/search', searchVerbs)
router.get('/:id', getVerbById);
router.get('/:id/conjugations', getVerbConjugations);

export default router;