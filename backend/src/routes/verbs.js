import { Router } from 'express';
import { getAllVerbs, getVerbById, searchVerbs, getVerbConjugations, getVerbFrenchConjugations } from '../controllers/verbsController.js';

const router = Router();

router.get('/', getAllVerbs);
router.get('/search', searchVerbs)
router.get('/:id', getVerbById);
router.get('/:id/conjugations', getVerbConjugations);
router.get('/:id/french-conjugations', getVerbFrenchConjugations);

export default router;