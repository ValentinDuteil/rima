<script>
    let { data } = $props();
</script>

<h1>Liste des verbes</h1>

{#if data.error}
  <p class="error">{data.error}</p>
{:else}
    {#each data.verbs as verb}
        <p>{verb.greek} - {verb.translation}</p>
    {/each}
{/if}

<style>
  .error {
    color: var(--danger);
    padding: var(--spacing-md);
    background: #ffe6e6;
    border-radius: var(--radius-sm);
  }
</style>