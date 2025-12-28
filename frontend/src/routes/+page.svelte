<h1>Liste des verbes</h1>

<script>
    let { data } = $props();
</script>

{#each data.verbs as verb}
  <p>{verb.greek}</p>
{/each}