import { PUBLIC_API_URL } from '$env/static/public';

export async function load({ url }) {
  try {
    const API_URL = PUBLIC_API_URL || 'http://localhost:3000';

    const sortParam = url.searchParams.get('sort') || 'greek';

    const response = await fetch(`${API_URL}/api/verbs?sort=${sortParam}`);

    if (!response.ok) {
      throw new Error('Erreur API');
    }

    const verbs = await response.json();
    return { 
      verbs, // Passe les données à +page.svelte
      currentSort: sortParam };  // dont le tri actuel

  } catch (error) {
    console.error('Erreur chargement verbes:', error);
    return { 
      verbs: [],
      error: 'Impossible de charger les verbes'
    };
  }
}