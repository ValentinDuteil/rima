export async function load() {
  const response = await fetch('http://localhost:3000/api/verbs');
  const verbs = await response.json();
  return { verbs };  // Passe les données à +page.svelte
}