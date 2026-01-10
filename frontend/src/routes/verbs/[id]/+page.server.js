import { PUBLIC_API_URL } from '$env/static/public';

export async function load({ params }) {
  const verbId = params.id;

  try {
    const API_URL = PUBLIC_API_URL || 'http://localhost:3000';

    let verbUrl = `${API_URL}/api/verbs/${verbId}`;
    let conjUrl = `${API_URL}/api/verbs/${verbId}/conjugations`;

    const [responseVerbUrl, responseConj] = await Promise.all([
      fetch(verbUrl),
      fetch(conjUrl)
    ]);

    if (!responseVerbUrl.ok || !responseConj.ok) {
      throw new Error('Erreur API');
    }
    const [verb, conjugations] = await Promise.all([
      responseVerbUrl.json(),
      responseConj.json()
    ]);

    return { verb, conjugations };

  } catch (error) {
    console.error('Erreur chargement verbes:', error);
    return {
      verb: null,
      conjugations: null,
      error: 'Impossible de charger les détails du verbe'
    };
  }
}