export const tenseMapping = {
  present: 'Présent',
  future: 'Futur',
  aorist: 'Aoriste',
  imperfect: 'Imparfait',
  perfect: 'Parfait',
  pluperfect: 'Plus-que-parfait',
  simple_past: 'Passé simple',
  compound_past: 'Passé composé',
  past_anterior: 'Passé antérieur',
  future_anterior: 'Futur antérieur',
  past: 'Passé',
  past_1: 'Passé 1ère forme',
  past_2: 'Passé 2ème forme'
};

export const moodMapping = {
  indicative: 'Indicatif',
  subjunctive: 'Subjonctif',
  imperative: 'Impératif',
  conditional: 'Conditionnel',
  infinitive: 'Infinitif',
  participle: 'Participe'
};

export const voiceMapping = {
  active: 'Actif',
  mediopassive: 'Médio-passif',
  passive: 'Passif'
};

export function translateLabel(key) {
  const [tense, mood, voice] = key.split('-');
  
  const translatedTense = tenseMapping[tense] || tense;
  const translatedMood = moodMapping[mood] || mood;
  const translatedVoice = voiceMapping[voice] || voice;
  
  return `${translatedTense} ${translatedMood} ${translatedVoice}`;
}