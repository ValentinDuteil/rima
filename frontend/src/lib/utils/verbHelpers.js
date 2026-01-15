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
}// Groupe les conjugaisons en fonction des temps/voix/mode....etc
function groupConjugations(tableauDeConjugaisons) {
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