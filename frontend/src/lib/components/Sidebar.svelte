<script>
  let { favoriteVerbs, removeFromDict } = $props();

</script>

<div>
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

