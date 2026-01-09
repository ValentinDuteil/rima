<script>
  let { favoriteVerbs, removeFromDict } = $props();

</script>

<div class="sidebar-temp">
  <h2>Mes favoris</h2>
  <ul>
    {#each favoriteVerbs as verb}
      <li>
        {verb.greek} - {verb.translation}
        <button onclick={() => removeFromDict(verb.id)}>🗑️</button>
      </li>
    {/each}
  </ul>
</div>

<style>
  .sidebar-temp {
    position: fixed;
    top: 100px;
    right: 20px;
    background: white;
    border: 2px solid var(--primary);
    border-radius: 8px;
    padding: 20px;
    max-width: 300px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  }

  h2 {
    margin: 0 0 10px 0;
    font-size: 1.2rem;
    color: var(--primary);
  }

  ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  li {
    padding: 8px 0;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  li:last-child {
    border-bottom: none;
  }

  button {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 1.2rem;
  }

  button:hover {
    opacity: 0.7;
  }
</style>