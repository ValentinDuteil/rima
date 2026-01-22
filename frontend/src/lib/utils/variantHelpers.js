export const variantLabels = {
  contracted: 'Contracté',
  modern: 'Moderne',
  modern_ousa: 'Moderne (-ούσα)',
  traditional_aga: 'Traditionnel (-άγα)',
  standard: 'Standard',
  movable_ne: 'Avec -νε',
  oral: 'Oral',
  formal: 'Formel'
  archaic: 'Archaïque'
};

export function translateVariant(variant) {
  return variantLabels[variant] || variant;
}

export const personLabelsFrench = {
  '1s': 'je',
  '2s': 'tu',
  '3s': 'il/elle',
  '1p': 'nous',
  '2p': 'vous',
  '3p': 'ils/elles'
};

const personLabelsGreek = {
  '1s': 'εγώ',
  '2s': 'εσύ',
  '3s': 'αυτός/ή',
  '1p': 'εμείς',
  '2p': 'εσείς',
  '3p': 'αυτοί/ές'
};

export function translatePerson(person, language = 'greek') {
  if (!person || person === 'null') return '';

  let labels;
  if (language === 'french') {
    labels = personLabelsFrench;
  } else {
    labels = personLabelsGreek;
  }

  return labels[person] || person;
}