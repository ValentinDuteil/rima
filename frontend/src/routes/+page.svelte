<script>
    let { data } = $props();
</script>

<h1>Liste des verbes</h1>

{#if data.error}
  <p class="error">{data.error}</p>
{:else}
    {#each data.verbs as verb}
        <p>{verb.greek}</p>
    {/each}
{/if}