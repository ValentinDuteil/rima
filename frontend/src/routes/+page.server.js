import { PUBLIC_API_URL } from '$env/static/public';

export async function load() {
  const API_URL = PUBLIC_API_URL || 'http://localhost:3000';
  const response = await fetch(`${API_URL}/api/verbs?sort=greek`);
  const verbs = await response.json();
  return { verbs };  // Passe les données à +page.svelte
}