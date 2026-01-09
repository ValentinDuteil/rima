<script>
  let { favoriteVerbs, removeFromDict } = $props();
</script>

<!-- Bouton flottant pour la sidebar -->
<button class="sidebar-toggle" onclick={toggleSidebar}>
  📚 {favoriteVerbs.length}
</button>
<!-- Overlay de la sidebar, ferme au clic extérieur -->
<div class="sidebar-ovelay" class:active={isOpen} onclick={closeSidebar}></div>
<!-- Sidebar -->
<aside class="sidebar" class:open={isOpen}>
  <div class="siedebar-header">
    <h2>Mes favoris</h2>
    <button class="close-btn" onclick={closeSidebar}>✕</button>
  </div>
  <div>
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
              class="delet-btn"
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

<style>

</style>
