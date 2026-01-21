<script>
import { groupConjugations, sortPersons } from '$lib/utils/verbHelpers';
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
        {#each sortPersons(forms) as conj}
          <div class="form-item" data-alternative={conj.is_alternative_form}>
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
        {#each sortPersons(forms) as conj}
          <div class="form-item" data-alternative={conj.is_alternative_form}>
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

<style>
  /* ========== HEADER DU VERBE ========== */
  h1 {
    text-align: center;
    margin-bottom: 2rem;
    color: var(--color-text, #333);
  }

  .verb-header {
    display: flex;
    gap: 2rem;
    justify-content: center;
    align-items: center;
    padding: 1.5rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 12px;
    margin-bottom: 3rem;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
  }

  .verb-greek {
    font-size: 2.5rem;
    font-weight: bold;
    color: white;
  }

  .verb-translation {
    font-size: 1.5rem;
    color: rgba(255, 255, 255, 0.9);
  }

  .verb-group {
    padding: 0.5rem 1rem;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    color: white;
    font-size: 0.9rem;
  }

  /* ========== SECTIONS ========== */
  h2 {
    font-size: 1.8rem;
    margin: 3rem 0 1.5rem 0;
    padding-bottom: 0.5rem;
    border-bottom: 3px solid;
  }

  h2:first-of-type {
    border-color: #4299e1;
    color: #2b6cb0;
  }

  h2:last-of-type {
    border-color: #48bb78;
    color: #276749;
  }

  /* ========== GROUPES DE CONJUGAISON ========== */
  .conj-group {
    margin-bottom: 2.5rem;
    padding: 1.5rem;
    background: #f7fafc;
    border-radius: 10px;
    border-left: 4px solid #cbd5e0;
    transition: transform 0.2s, box-shadow 0.2s;
  }

  .conj-group:hover {
    transform: translateX(5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  h3 {
    font-size: 1.3rem;
    margin-bottom: 1rem;
    color: #2d3748;
    font-weight: 600;
  }

  /* ========== FORMES ========== */
  .forms {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
  }

  .form-item {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    padding: 0.75rem 1rem;
    background: white;
    border-radius: 6px;
    background-color: 0.2s;
  }

  .form-item:hover {
    background: #edf2f7;
  }

  .person {
    font-weight: 600;
    color: #4a5568;
    min-width: 40px;
    font-size: 0.9rem;
  }

  .form {
    font-size: 1.1rem;
    color: #1a202c;
  }

  /* ========== FORMES ALTERNATIVES ========== */
  .form-item[data-alternative="true"] .form {
    color: #718096;
    font-style: italic;
    opacity: 0.8;
  }

  /* ========== RESPONSIVE ========== */
  @media (max-width: 768px) {
    .verb-header {
      flex-direction: column;
      gap: 1rem;
    }

    .verb-greek {
      font-size: 2rem;
    }

    .form-item {
      gap: 1rem;
    }
  }
</style>