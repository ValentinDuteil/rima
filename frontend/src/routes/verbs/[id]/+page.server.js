import { PUBLIC_API_URL } from '$env/static/public';
import { error } from '@sveltejs/kit';

export async function load({ params }) {
  const verbId = params.id;

  try {
    const API_URL = PUBLIC_API_URL || 'http://localhost:3000';

    let verbUrl = `${API_URL}/api/verbs/${verbId}`;
    let conjUrl = `${API_URL}/api/verbs/${verbId}/conjugations`;
    let frenchConj = `${API_URL}/api/verbs/${verbId}/french-conjugations`;

    const [responseVerbUrl, responseConj, responseFrenchConj] = await Promise.all([
      fetch(verbUrl),
      fetch(conjUrl),
      fetch(frenchConj),
    ]);

    if (!responseVerbUrl.ok || !responseConj.ok) {
      throw error(404, 'Verbe non trouvé');
    }
    const [verb, conjugations] = await Promise.all([
      responseVerbUrl.json(),
      responseConj.json(),
    ]);

    let frenchConjugations = [];
    if (responseFrenchConj.ok) {
      frenchConjugations = await responseFrenchConj.json();
    }

    return { verb, conjugations, frenchConjugations };

  } catch (err) {
    if (err.status) {
      throw err;
    }
    console.error('Erreur chargement verbes:', err);
    return {
      verb: null,
      conjugations: null,
      frenchConjugations: null,
      error: 'Impossible de charger les détails du verbe'
    };
  }
}