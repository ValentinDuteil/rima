<script>
    let { data } = $props();

    //Placer des séparateurs pour faciliter le parcours de la liste de verbes
    function groupByFirstLetter(verbs, sortType) {
        const groups = {};

        verbs.forEach((verb) => {
            let firstLetter;

                //Utilise la langue du tri
                if (sortType === 'greek') {
                    firstLetter = verb.greek[0].toUpperCase();
                } else {
                    firstLetter = verb.translation[0].toUpperCase();
                }

            if (!groups[firstLetter]) {
                groups[firstLetter] = [];
            }
            groups[firstLetter].push(verb);
        });
        return groups;
    }

    const verbGroups = groupByFirstLetter(data.verbs, data.currentSort);
    // Si verbGroups = { "Α": [...], "Π": [...], "Σ": [...] }
    const letters = Object.keys(verbGroups).sort(); // → ["Α", "Π", "Σ"]
</script>

<div class="header-controls">
    <h1>Liste des verbes</h1>
    <div class="sort-buttons">
        <a
            href="/?sort=french"
            class="btn-sort"
            class:active={data.currentSort === "french"}
        >
            Tri Français
        </a>
        <a
            href="/?sort=greek"
            class="btn-sort"
            class:active={data.currentSort === "greek"}
        >
            Tri Grec
        </a>
    </div>
</div>

{#if data.error}
    <p class="error">{data.error}</p>
{:else}
    <div class="verbs-list">
        {#each letters as letter}
            <div class="letter-separator">─── {letter} ───</div>
            {#each verbGroups[letter] as verb}
                <div class="verb-item">
                    <span class="greek">{verb.greek}</span>
                    <span class="translation">{verb.translation}</span>
                </div>
            {/each}
        {/each}
    </div>
{/if}

<style>
    .header-controls {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: var(--spacing-lg);
    }

    .sort-buttons {
        display: flex;
        gap: var(--spacing-sm);
    }

    .btn-sort {
        padding: var(--spacing-sm) var(--spacing-md);
        border: 2px solid var(--secondary);
        border-radius: var(--radius-sm);
        color: var(--secondary);
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s;
    }

    .btn-sort:hover {
        background: var(--secondary);
        color: white;
    }

    .btn-sort.active {
        background: var(--secondary);
        color: white;
    }

    .verbs-list {
        background: var(--bg-card);
        border-radius: var(--radius-md);
        padding: var(--spacing-md);
        box-shadow: var(--shadow);
        width: clamp(300px, 95dvw, 900px);
        margin: 0 auto;
    }

    .verb-item {
        display: flex;
        justify-content: space-between;
        gap: var(--spacing-md);
        padding: var(--spacing-sm);
        border-bottom: 1px solid #eee;
    }

    .verb-item:last-child {
        border-bottom: none;
    }

    .greek {
        font-weight: bold;
        color: var(--primary);
        min-width: 150px;
        text-align: left;
    }

    .translation {
        color: var(--text-light);
        text-align: right;
    }

    .letter-separator {
        text-align: center;
        color: var(--secondary);
        font-weight: bold;
        font-size: var(--font-size-lg);
        padding: var(--spacing-md) 0;
        margin-top: var(--spacing-lg);
    }

    .letter-separator:first-child {
        margin-top: 0;
    }

    .error {
        color: var(--danger);
        padding: var(--spacing-md);
        background: #ffe6e6;
        border-radius: var(--radius-sm);
    }
</style>
