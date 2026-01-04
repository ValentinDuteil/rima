<script>
  import { PUBLIC_API_URL } from "$env/static/public";

  let searchTerm = $state("");
  let searchResults = $state([]);
  let showDropdown = $state(false);

  async function handleSearch() {
    if (searchTerm === "") {
      searchResults = [];
      showDropdown = false;
      return;
    }
    const url = `${PUBLIC_API_URL}/api/verbs/search?q=${searchTerm}`;

    const response = await fetch(url);
    const data = await response.json();

    searchResults = data;
    showDropdown = true;
  }
</script>

<header>
  <div class="container">
    <a href="/" class="logo">RIMA</a>
    <nav>
      <div class="search-wrapper">
        <input
          type="search"
          placeholder="Rechercher un verbe..."
          bind:value={searchTerm}
          oninput={handleSearch}
        />
        {#if showDropdown}
          <div class="dropdown">
            {#each searchResults as result}
              <a href="/verbs/{result.id}">
                {result.greek} - {result.translation}
              </a>
            {/each}
          </div>
        {/if}
      </div>
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

  .search-wrapper {
    position: relative;
  }

  .dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: var(--radius-sm);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    max-height: 300px;
    overflow-y: auto;
    z-index: 1000;
  }

  .dropdown a {
    display: block;
    padding: var(--spacing-sm) var(--spacing-md);
    color: var(--text-dark);
    text-decoration: none;
    border-bottom: 1px solid #eee;
  }

  .dropdown a:hover {
    background: var(--bg-main);
  }

  .dropdown a:last-child {
    border-bottom: none;
  }
</style>
