// Groupe les verbes par première lettre
export function groupByFirstLetter(verbs, sortType) {
  const groups = {};

  verbs.forEach((verb) => {
    let firstLetter;

    if (sortType === "greek") {
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

  // Groupe les conjugaisons en fonction des temps/voix/mode....etc
  export function groupConjugations(tableauDeConjugaisons) {
    const objectGroup = {};

    for (const uneConjugaison of tableauDeConjugaisons) {
      const etiquette = `${uneConjugaison.tense}-${uneConjugaison.mood}-${uneConjugaison.voice}`;
      if (!objectGroup[etiquette]) {
        objectGroup[etiquette] = [];
      }
      objectGroup[etiquette].push(uneConjugaison)
    }

    return objectGroup;
  }

//Tri des personnes dans les tableaux de conjugaison

/**
 * Trie les conjugaisons par ordre de personne
 * @param {Array} conjugations - Tableau de conjugaisons
 * @returns {Array} - Tableau trié
 */

export function sortPersons(conjugations) {
  const reference = ['1s', '2s', '3s', '1p', '2p', '3p'];
  return conjugations.sort((a, b) => {
    const indexA = reference.indexOf(a.person);
    const indexB = reference.indexOf(b.person);
    return indexA - indexB; 
  })
};
