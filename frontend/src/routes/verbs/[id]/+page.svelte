<script>
import { groupConjugations } from '$lib/utils/verbHelpers';

function safeGroupConjugations(conjugations) {
  if (conjugations) {
    return groupConjugations(conjugations);
  } else {
    return {};
  }
}

let { data } = $props();
let groupedGreek = $derived(safeGroupConjugations(data.conjugations));
let groupedFrench = $derived(safeGroupConjugations(data.frenchConjugations));

</script>

<h1>Détails du verbe</h1>

<pre>{JSON.stringify(groupedGreek, null, 2)}</pre>

<div class="verb-header">
  <div class="verb-greek">{data.verb.greek}</div>
  <div class="verb-translation">{data.verb.translation}</div>
  <div class="verb-group">Groupe : {data.verb.group}</div>
</div>

<h2>Conjugaisons</h2>

{#if data.conjugations && data.conjugations.length > 0}
  <div class="conjugations">
    {#each data.conjugations as conj}
      <div class="conj-item">
        <span class="person">{conj.person}</span>
        <span class="form">{conj.form}</span>
      </div>
    {/each}
  </div>
{:else}
  <p>Aucune conjugaison disponible</p>
{/if}