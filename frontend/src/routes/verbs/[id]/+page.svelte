<script>
import { groupConjugations } from '$lib/utils/verbHelpers';
import { translateLabel } from '$lib/utils/labelHelpers';

// Fonction de protection pour éviter les erreurs si les données sont null
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

<div class="verb-header">
  <div class="verb-greek">{data.verb.greek}</div>
  <div class="verb-translation">{data.verb.translation}</div>
  <div class="verb-group">Groupe : {data.verb.group}</div>
</div>

<h2>📘 Conjugaisons Grecques</h2>

{#if Object.keys(groupedGreek).length > 0}
  {#each Object.entries(groupedGreek) as [groupName, forms]}
    <div class="conj-group">
      <h3>{translateLabel(groupName)}</h3>
      <div class="forms">
        {#each forms as conj}
          <div class="form-item">
            <span class="person">{conj.person}</span>
            <span class="form">{conj.form}</span>
          </div>
        {/each}
      </div>
    </div>
  {/each}
{:else}
  <p>Aucune conjugaison grecque disponible</p>
{/if}

<h2>📗 Conjugaisons Françaises</h2>

{#if Object.keys(groupedFrench).length > 0}
  {#each Object.entries(groupedFrench) as [groupName, forms]}
    <div class="conj-group">
      <h3>{translateLabel(groupName)}</h3>
      <div class="forms">
        {#each forms as conj}
          <div class="form-item">
            <span class="person">{conj.person}</span>
            <span class="form">{conj.form}</span>
          </div>
        {/each}
      </div>
    </div>
  {/each}
{:else}
  <p>Aucune conjugaison française disponible</p>
{/if}