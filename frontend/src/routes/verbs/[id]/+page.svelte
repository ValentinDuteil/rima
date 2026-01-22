<script>
  import {
    groupConjugations,
    groupByVariant,
    sortPersons,
  } from "$lib/utils/verbHelpers";
  import { translateLabel } from "$lib/utils/labelHelpers";
  import { translateVariant, translatePerson } from "$lib/utils/variantHelpers";

  // Fonction de protection pour éviter les erreurs si les données sont null
  function safeGroupConjugations(conjugations) {
    if (conjugations) {
      return groupConjugations(conjugations);
    } else {
      return {};
    }
  }

  let { data } = $props();

  //Grouper par temps-voix-mode
  let groupedGreek = $derived(safeGroupConjugations(data.conjugations));
  let groupedFrench = $derived(safeGroupConjugations(data.frenchConjugations));

  //Grouper par variant_group au sein de chaque temps
  let variantGroupedGreek = $derived(
    Object.fromEntries(
      Object.entries(groupedGreek).map(([key, conjugations]) => {
        return [key, groupByVariant(conjugations)];
      }),
    ),
  );
  let variantGroupedFrench = $derived(
    Object.fromEntries(
      Object.entries(groupedFrench).map(([key, conjugations]) => {
        return [key, groupByVariant(conjugations)];
      }),
    ),
  );

  //Nouvelles notions :
  //===================
  //
  // Object.entries(groupedGreek)
  // Transforme l'objet en tableau :
  // [
  //   ['present-indicative-active', [conjugaisons...]],
  //   ['imperfect-indicative-active', [conjugaisons...]]
  // ]

  //.map(([key, conjugations]) => {
  //  return [key, groupByVariant(conjugations)];
  //})
  // Pour chaque paire [clé, conjugaisons] :
  // - Garde la même clé
  // - Applique groupByVariant() sur les conjugaisons
  // Résultat :
  // [
  //   ['present-indicative-active', { contracted: {...}, modern: {...} }],
  //   ['imperfect-indicative-active', { modern_ousa: {...}, traditional_aga: {...} }]
  // ]
</script>

<h1>Détails du verbe</h1>

<div class="verb-header">
  <div class="verb-greek">{data.verb.greek}</div>
  <div class="verb-translation">{data.verb.translation}</div>
  <div class="verb-group">Groupe : {data.verb.group}</div>
</div>

<h2>📘 Conjugaisons Grecques</h2>

<!-- ⭐ FILTRES STATIQUES -->
<div class="filters-container">
  <div class="filter-group">
    <label for="filter-lang">Langue :</label>
    <select id="filter-lang" disabled>
      <option value="both">Grec + Français</option>
      <option value="greek">Grec uniquement</option>
      <option value="french">Français uniquement</option>
    </select>
  </div>

  <div class="filter-group">
    <label for="filter-mood">Mode :</label>
    <select id="filter-mood" disabled>
      <option value="">Tous</option>
      <option value="indicative">Indicatif</option>
      <option value="subjunctive">Subjonctif</option>
      <option value="imperative">Impératif</option>
      <option value="infinitive">Infinitif</option>
      <option value="participle">Participe</option>
      <option value="conditional">Conditionnel</option>
    </select>
  </div>

  <div class="filter-group">
    <label for="filter-voice">Voix :</label>
    <select id="filter-voice" disabled>
      <option value="">Toutes</option>
      <option value="active">Actif</option>
      <option value="mediopassive">Médio-passif</option>
      <option value="passive">Passif</option>
    </select>
  </div>

  <div class="filter-group">
    <label for="filter-tense">Temps :</label>
    <select id="filter-tense" disabled>
      <option value="">Tous</option>
      <option value="present">Présent</option>
      <option value="imperfect">Imparfait</option>
      <option value="aorist">Aoriste</option>
      <option value="future">Futur</option>
      <option value="perfect">Parfait</option>
      <option value="pluperfect">Plus-que-parfait</option>
      <option value="simple_past">Passé simple</option>
      <option value="compound_past">Passé composé</option>
    </select>
  </div>
</div>

{#if Object.keys(groupedGreek).length > 0}
  {#each Object.entries(variantGroupedGreek) as [groupName, variantGroups]}
    <div class="conj-group">
      <h3>{translateLabel(groupName)}</h3>

      <!-- Affichage des variants en colonnes -->
      <div class="variants-container">
        {#each Object.entries(variantGroups) as [variantName, persons]}
          <div class="variant-column">
            <h4 class="variant-title">{translateVariant(variantName)}</h4>

            <!-- Affichage par personnes, avec leurs conjugaisons alternatives -->
            <div class="forms">
              {#each Object.entries(persons) as [person, forms]}
                <div class="form-item">
                  <span class="person">{translatePerson(person)}</span>
                  <span class="form">{forms.join(" / ")}</span>
                </div>
              {/each}
            </div>
          </div>
        {/each}
      </div>
    </div>
  {/each}
{:else}
  <p>Aucune conjugaison grecque disponible</p>
{/if}

<h2>📗 Conjugaisons Françaises</h2>

{#if Object.keys(variantGroupedFrench).length > 0}
  {#each Object.entries(variantGroupedFrench) as [groupName, variantGroups]}
    <div class="conj-group">
      <h3>{translateLabel(groupName)}</h3>

      <!-- Affichage des variants en colonnes -->
      <div class="variants-container">
        {#each Object.entries(variantGroups) as [variantName, persons]}
          <div class="variant-column">
            <h4 class="variant-title">{translateVariant(variantName)}</h4>

            <!-- Affichage par personnes, avec leurs conjugaisons alternatives -->
            <div class="forms">
              {#each Object.entries(persons) as [person, forms]}
                <div class="form-item">
                  <span class="person"
                    >{translatePerson(person, "french", forms[0])}</span
                  >
                  <span class="form">{forms.join(" / ")}</span>
                </div>
              {/each}
            </div>
          </div>
        {/each}
      </div>
    </div>
  {/each}
{:else}
  <p>Aucune conjugaison française disponible</p>
{/if}

<style>
  /* ========== FILTRES ========== */
  .filters-container {
    display: flex;
    gap: 1.5rem;
    margin-bottom: 2rem;
    padding: 1rem;
    background: white;
    border-radius: 8px;
    border: 1px solid #e2e8f0;
    flex-wrap: wrap;
  }

  .filter-group {
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .filter-group label {
    font-size: 0.9rem;
    font-weight: 600;
    color: #4a5568;
  }

  .filter-group select {
    padding: 0.5rem 2rem 0.5rem 0.75rem;
    border: 1px solid #cbd5e0;
    border-radius: 6px;
    background: white;
    font-size: 0.9rem;
    color: #2d3748;
    cursor: pointer;
    transition: border-color 0.2s;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%234a5568' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 0.5rem center;
  }

  .filter-group select:hover {
    border-color: #667eea;
  }

  .filter-group select:disabled {
    opacity: 0.6;
    cursor: not-allowed;
  }

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
    transition:
      transform 0.2s,
      box-shadow 0.2s;
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
    color: #a0aec0;
    min-width: 40px;
    font-size: 0.85rem;
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

  /* ========== VARIANTS EN COLONNES ========== */
  .variants-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1rem;
    margin-top: 1rem;
  }

  .variant-column {
    background: white;
    padding: 1rem;
    border-radius: 6px;
    border: 1px solid #e2e8f0;
  }

  .variant-title {
    font-size: 0.9rem;
    font-weight: 600;
    color: #667eea;
    margin-bottom: 0.75rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #e2e8f0;
    text-transform: capitalize;
  }

  /* Ajuster .forms pour les colonnes */
  .variant-column .forms {
    gap: 0.25rem;
  }

  .variant-column .form-item {
    padding: 0.4rem 0.5rem;
    background: transparent;
    border-bottom: 1px solid #f7fafc;
  }

  .variant-column .form-item:hover {
    background: #f7fafc;
  }

  .variant-column .form-item:last-child {
    border-bottom: none;
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
