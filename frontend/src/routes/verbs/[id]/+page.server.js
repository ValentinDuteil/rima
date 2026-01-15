import { PUBLIC_API_URL } from '$env/static/public';

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

    if (!responseVerbUrl.ok || !responseConj.ok || !responseFrenchConj.ok) {
      throw new Error('Erreur API');
    }
    const [verb, conjugations, frenchConjugations] = await Promise.all([
      responseVerbUrl.json(),
      responseConj.json(),
      responseFrenchConj.json(),
    ]);

    return { verb, conjugations, frenchConjugations };

  } catch (error) {
    console.error('Erreur chargement verbes:', error);
    return {
      verb: null,
      conjugations: null,
      frenchConjugations: null,
      error: 'Impossible de charger les détails du verbe'
    };
  }
}