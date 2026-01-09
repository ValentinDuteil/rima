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