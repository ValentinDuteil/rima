<script>
  import { browser } from '$app/environment';

  let { favoriteVerbs, removeFromDict } = $props();

  let isOpen = $state(false);
  let sidebarSort = $state('greek');

  function toggleSidebar() {
    isOpen = !isOpen;
  }

  function closeSidebar() {
    isOpen = false;
  }
</script>
{#if browser}
<!-- Bouton flottant pour la sidebar -->
<button class="sidebar-toggle" onclick={toggleSidebar}>
  📚 {favoriteVerbs.length}
</button>
<!-- Overlay de la sidebar, ferme au clic extérieur -->
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div class="sidebar-overlay" class:active={isOpen} onclick={closeSidebar}></div>
<!-- Sidebar -->
<aside class="sidebar" class:open={isOpen}>
  <div class="sidebar-header">
    <h2>Mes favoris</h2>
  </div>
  <div class="sidebar-content">
    {#if favoriteVerbs.length === 0}
      <p class="empty-state">
        Tu n'as pas encore de verbes à ton dictionnaire ! 😉
      </p>
    {:else}
      <ul>
        {#each favoriteVerbs as verb}
          <li>
            <div class="verb-info">
              <span class="greek">{verb.greek}</span>
              <span class="translation">{verb.translation}</span>
            </div>
            <button
              class="delete-btn"
              onclick={() => removeFromDict(verb.id)}
              title="Retirer du dictionnaire"
            >
              🗑️
            </button>
          </li>
        {/each}
      </ul>
    {/if}
  </div>
</aside>
{/if}

<style>
  /* Bouton flottant */
  .sidebar-toggle {
    position: fixed;
    top: 20px;
    right: 20px;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 50%;
    width: 60px;
    height: 60px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
    z-index: 999;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 2px;
    font-size: 1.2rem;
  }

  .sidebar-toggle:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.3);
  }

  /* Overlay */
  .sidebar-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background: rgba(0, 0, 0, 0.5);
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s ease;
    z-index: 1000;
  }

  .sidebar-overlay.active {
    opacity: 1;
    pointer-events: auto;
  }

  /* Sidebar */
  .sidebar {
    position: fixed;
    top: 0;
    right: -400px;
    width: 400px;
    max-width: 90vw;
    height: 100vh;
    background: var(--bg-card);
    box-shadow: -4px 0 20px rgba(0, 0, 0, 0.2);
    transition: right 0.3s ease;
    z-index: 1001;
    display: flex;
    flex-direction: column;
  }

  .sidebar.open {
    right: 0;
  }

  /* Header de la sidebar */
  .sidebar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: var(--spacing-lg);
    border-bottom: 2px solid var(--primary);
    background: linear-gradient(to right, var(--primary), var(--secondary));
  }

  .sidebar-header h2 {
    margin: 0;
    font-size: 1.2rem;
    color: white;
  }

  /* Contenu de la sidebar */
  .sidebar-content {
    flex: 1;
    overflow-y: auto;
    padding: 0;
  }

  .empty-state {
    text-align: center;
    color: var(--text-light);
    padding: var(--spacing-xl);
    font-style: italic;
  }

  ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  li {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 6px 16px;
    transition: background-color 0.2s ease;
    font-size: 0.9 rem;
  }

  li:hover {
    background: rgba(0, 0, 0, 0.02);
  }

  li:last-child {
    border-bottom: none;
  }

  .verb-info {
    display: flex;
    gap: 8 px;
    align-items: center;
    flex: 1;
  }

  .greek {
    font-weight: 600;
    color: var(--primary);
    min-width: 80px;
  }

  .translation {
    color: var(--text-light);
  }

  .delete-btn {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 1.1rem;
    padding: 4px;
    border-radius: 50%;
    transition: all 0.2s ease;
    opacity: 0.6;
  }

  .delete-btn:hover {
    background: rgba(255, 0, 212, 0.13);
    transform: scale(1.2);
  }

  /* Responsive */
  @media (max-width: 768px) {
    .sidebar {
      width: 100%;
      right: -100%;
    }

    .sidebar-toggle {
      width: 50px;
      height: 50px;
      font-size: 1rem;
    }
  }
</style>
