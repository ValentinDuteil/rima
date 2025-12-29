<script>
  import { PUBLIC_API_URL } from '$env/static/public';

  let searchTerm = $state('');
  let searchResults = $state([]);
  let showDropdown = $state(false);

function handleSearch() {
  if (searchTerm === '') {
    searchResults = [];
    showDropdown = false;
    return;
  }
  const url = `${PUBLIC_API_URL}/api/verbs/search?q=${searchTerm}`;
}
</script>

<header>
  <div class="container">
    <a href="/" class="logo">RIMA</a>
    <nav>
      <input type="search" placeholder="Rechercher un verbe..." />
      <button class="btn-connexion">Connexion</button>
      <button class="btn-menu">☰</button>
    </nav>
  </div>
</header>

<style>
      header {
    background: var(--bg-header);
    color: var(--text-white);
    padding: var(--spacing-md);
    box-shadow: var(--shadow);
  }
  
  .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .logo {
    font-size: var(--font-size-xl);
    font-weight: bold;
    color: var(--text-white);
    text-decoration: none;
  }
  
  .logo:hover {
    text-decoration: none;
    opacity: 0.9;
  }
  
  nav {
    display: flex;
    gap: var(--spacing-md);
    align-items: center;
  }
  
  input {
    padding: var(--spacing-sm) var(--spacing-md);
    border-radius: var(--radius-sm);
    border: none;
    min-width: 250px;
  }
  
  button {
    padding: var(--spacing-sm) var(--spacing-md);
    border-radius: var(--radius-sm);
    border: none;
    background: var(--secondary);
    color: var(--text-white);
    cursor: pointer;
    font-weight: 500;
  }
  
  button:hover {
    opacity: 0.9;
  }
  
  .btn-menu {
    background: transparent;
    border: 1px solid var(--text-white);
  }
</style>