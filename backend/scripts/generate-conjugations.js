// Script pour générer les INSERT SQL des conjugaisons complètes de αγαπώ / aimer
// Usage: node backend/seeders/generate-conjugations.js

// ============================================
// CONJUGAISONS GRECQUES - ACTIF
// ============================================

const greekActive = {
  present_indicative: [
    { person: '1s', form: 'αγαπώ' },
    { person: '2s', form: 'αγαπάς' },
    { person: '3s', form: 'αγαπά' },
    { person: '1p', form: 'αγαπούμε' },
    { person: '2p', form: 'αγαπάτε' },
    { person: '3p', form: 'αγαπούν' }
  ],
  future_indicative: [
    { person: '1s', form: 'θα αγαπήσω' },
    { person: '2s', form: 'θα αγαπήσεις' },
    { person: '3s', form: 'θα αγαπήσει' },
    { person: '1p', form: 'θα αγαπήσουμε' },
    { person: '2p', form: 'θα αγαπήσετε' },
    { person: '3p', form: 'θα αγαπήσουν' }
  ],
  aorist_indicative: [
    { person: '1s', form: 'αγάπησα' },
    { person: '2s', form: 'αγάπησες' },
    { person: '3s', form: 'αγάπησε' },
    { person: '1p', form: 'αγαπήσαμε' },
    { person: '2p', form: 'αγαπήσατε' },
    { person: '3p', form: 'αγάπησαν' }
  ],
  imperfect_indicative: [
    { person: '1s', form: 'αγαπούσα' },
    { person: '2s', form: 'αγαπούσες' },
    { person: '3s', form: 'αγαπούσε' },
    { person: '1p', form: 'αγαπούσαμε' },
    { person: '2p', form: 'αγαπούσατε' },
    { person: '3p', form: 'αγαπούσαν' }
  ],
  present_imperative: [
    { person: '2s', form: 'αγάπα' },
    { person: '2p', form: 'αγαπάτε' }
  ],
  aorist_imperative: [
    { person: '2s', form: 'αγάπησε' },
    { person: '2p', form: 'αγαπήστε' }
  ],
  aorist_subjunctive: [
    { person: '1s', form: 'να αγαπήσω' },
    { person: '2s', form: 'να αγαπήσεις' },
    { person: '3s', form: 'να αγαπήσει' },
    { person: '1p', form: 'να αγαπήσουμε' },
    { person: '2p', form: 'να αγαπήσετε' },
    { person: '3p', form: 'να αγαπήσουν' }
  ],
  perfect: [
    { person: '1s', form: 'έχω αγαπήσει' },
    { person: '2s', form: 'έχεις αγαπήσει' },
    { person: '3s', form: 'έχει αγαπήσει' },
    { person: '1p', form: 'έχουμε αγαπήσει' },
    { person: '2p', form: 'έχετε αγαπήσει' },
    { person: '3p', form: 'έχουν αγαπήσει' }
  ],
  pluperfect: [
    { person: '1s', form: 'είχα αγαπήσει' },
    { person: '2s', form: 'είχες αγαπήσει' },
    { person: '3s', form: 'είχε αγαπήσει' },
    { person: '1p', form: 'είχαμε αγαπήσει' },
    { person: '2p', form: 'είχατε αγαπήσει' },
    { person: '3p', form: 'είχαν αγαπήσει' }
  ]
};

// ============================================
// CONJUGAISONS GRECQUES - MÉDIO-PASSIF
// ============================================

const greekPassive = {
  present_indicative: [
    { person: '1s', form: 'αγαπιέμαι' },
    { person: '2s', form: 'αγαπιέσαι' },
    { person: '3s', form: 'αγαπιέται' },
    { person: '1p', form: 'αγαπιόμαστε' },
    { person: '2p', form: 'αγαπιέστε' },
    { person: '3p', form: 'αγαπιούνται' }
  ],
  future_indicative: [
    { person: '1s', form: 'θα αγαπηθώ' },
    { person: '2s', form: 'θα αγαπηθείς' },
    { person: '3s', form: 'θα αγαπηθεί' },
    { person: '1p', form: 'θα αγαπηθούμε' },
    { person: '2p', form: 'θα αγαπηθείτε' },
    { person: '3p', form: 'θα αγαπηθούν' }
  ],
  aorist_indicative: [
    { person: '1s', form: 'αγαπήθηκα' },
    { person: '2s', form: 'αγαπήθηκες' },
    { person: '3s', form: 'αγαπήθηκε' },
    { person: '1p', form: 'αγαπηθήκαμε' },
    { person: '2p', form: 'αγαπηθήκατε' },
    { person: '3p', form: 'αγαπήθηκαν' }
  ],
  imperfect_indicative: [
    { person: '1s', form: 'αγαπιόμουν' },
    { person: '2s', form: 'αγαπιόσουν' },
    { person: '3s', form: 'αγαπιόταν' },
    { person: '1p', form: 'αγαπιόμαστε' },
    { person: '2p', form: 'αγαπιόσαστε' },
    { person: '3p', form: 'αγαπιόνταν' }
  ],
  present_imperative: [
    { person: '2p', form: 'αγαπιέστε' }
  ],
  aorist_imperative: [
    { person: '2s', form: 'αγαπήσου' },
    { person: '2p', form: 'αγαπηθείτε' }
  ],
  aorist_subjunctive: [
    { person: '1s', form: 'να αγαπηθώ' },
    { person: '2s', form: 'να αγαπηθείς' },
    { person: '3s', form: 'να αγαπηθεί' },
    { person: '1p', form: 'να αγαπηθούμε' },
    { person: '2p', form: 'να αγαπηθείτε' },
    { person: '3p', form: 'να αγαπηθούν' }
  ],
  perfect: [
    { person: '1s', form: 'έχω αγαπηθεί' },
    { person: '2s', form: 'έχεις αγαπηθεί' },
    { person: '3s', form: 'έχει αγαπηθεί' },
    { person: '1p', form: 'έχουμε αγαπηθεί' },
    { person: '2p', form: 'έχετε αγαπηθεί' },
    { person: '3p', form: 'έχουν αγαπηθεί' }
  ],
  pluperfect: [
    { person: '1s', form: 'είχα αγαπηθεί' },
    { person: '2s', form: 'είχες αγαπηθεί' },
    { person: '3s', form: 'είχε αγαπηθεί' },
    { person: '1p', form: 'είχαμε αγαπηθεί' },
    { person: '2p', form: 'είχατε αγαπηθεί' },
    { person: '3p', form: 'είχαν αγαπηθεί' }
  ]
};

// ============================================
// CONJUGAISONS FRANÇAISES - ACTIF
// ============================================

const frenchActive = {
  present_indicative: [
    { person: '1s', form: 'j\'aime' },
    { person: '2s', form: 'tu aimes' },
    { person: '3s', form: 'il/elle aime' },
    { person: '1p', form: 'nous aimons' },
    { person: '2p', form: 'vous aimez' },
    { person: '3p', form: 'ils/elles aiment' }
  ],
  imperfect_indicative: [
    { person: '1s', form: 'j\'aimais' },
    { person: '2s', form: 'tu aimais' },
    { person: '3s', form: 'il/elle aimait' },
    { person: '1p', form: 'nous aimions' },
    { person: '2p', form: 'vous aimiez' },
    { person: '3p', form: 'ils/elles aimaient' }
  ],
  future_indicative: [
    { person: '1s', form: 'j\'aimerai' },
    { person: '2s', form: 'tu aimeras' },
    { person: '3s', form: 'il/elle aimera' },
    { person: '1p', form: 'nous aimerons' },
    { person: '2p', form: 'vous aimerez' },
    { person: '3p', form: 'ils/elles aimeront' }
  ],
  simple_past_indicative: [
    { person: '1s', form: 'j\'aimai' },
    { person: '2s', form: 'tu aimas' },
    { person: '3s', form: 'il/elle aima' },
    { person: '1p', form: 'nous aimâmes' },
    { person: '2p', form: 'vous aimâtes' },
    { person: '3p', form: 'ils/elles aimèrent' }
  ],
  compound_past_indicative: [
    { person: '1s', form: 'j\'ai aimé' },
    { person: '2s', form: 'tu as aimé' },
    { person: '3s', form: 'il/elle a aimé' },
    { person: '1p', form: 'nous avons aimé' },
    { person: '2p', form: 'vous avez aimé' },
    { person: '3p', form: 'ils/elles ont aimé' }
  ],
  pluperfect_indicative: [
    { person: '1s', form: 'j\'avais aimé' },
    { person: '2s', form: 'tu avais aimé' },
    { person: '3s', form: 'il/elle avait aimé' },
    { person: '1p', form: 'nous avions aimé' },
    { person: '2p', form: 'vous aviez aimé' },
    { person: '3p', form: 'ils/elles avaient aimé' }
  ],
  past_anterior_indicative: [
    { person: '1s', form: 'j\'eus aimé' },
    { person: '2s', form: 'tu eus aimé' },
    { person: '3s', form: 'il/elle eut aimé' },
    { person: '1p', form: 'nous eûmes aimé' },
    { person: '2p', form: 'vous eûtes aimé' },
    { person: '3p', form: 'ils/elles eurent aimé' }
  ],
  future_anterior_indicative: [
    { person: '1s', form: 'j\'aurai aimé' },
    { person: '2s', form: 'tu auras aimé' },
    { person: '3s', form: 'il/elle aura aimé' },
    { person: '1p', form: 'nous aurons aimé' },
    { person: '2p', form: 'vous aurez aimé' },
    { person: '3p', form: 'ils/elles auront aimé' }
  ],
  present_subjunctive: [
    { person: '1s', form: 'que j\'aime' },
    { person: '2s', form: 'que tu aimes' },
    { person: '3s', form: 'qu\'il/elle aime' },
    { person: '1p', form: 'que nous aimions' },
    { person: '2p', form: 'que vous aimiez' },
    { person: '3p', form: 'qu\'ils/elles aiment' }
  ],
  imperfect_subjunctive: [
    { person: '1s', form: 'que j\'aimasse' },
    { person: '2s', form: 'que tu aimasses' },
    { person: '3s', form: 'qu\'il/elle aimât' },
    { person: '1p', form: 'que nous aimassions' },
    { person: '2p', form: 'que vous aimassiez' },
    { person: '3p', form: 'qu\'ils/elles aimassent' }
  ],
  past_subjunctive: [
    { person: '1s', form: 'que j\'aie aimé' },
    { person: '2s', form: 'que tu aies aimé' },
    { person: '3s', form: 'qu\'il/elle ait aimé' },
    { person: '1p', form: 'que nous ayons aimé' },
    { person: '2p', form: 'que vous ayez aimé' },
    { person: '3p', form: 'qu\'ils/elles aient aimé' }
  ],
  pluperfect_subjunctive: [
    { person: '1s', form: 'que j\'eusse aimé' },
    { person: '2s', form: 'que tu eusses aimé' },
    { person: '3s', form: 'qu\'il/elle eût aimé' },
    { person: '1p', form: 'que nous eussions aimé' },
    { person: '2p', form: 'que vous eussiez aimé' },
    { person: '3p', form: 'qu\'ils/elles eussent aimé' }
  ],
  present_conditional: [
    { person: '1s', form: 'j\'aimerais' },
    { person: '2s', form: 'tu aimerais' },
    { person: '3s', form: 'il/elle aimerait' },
    { person: '1p', form: 'nous aimerions' },
    { person: '2p', form: 'vous aimeriez' },
    { person: '3p', form: 'ils/elles aimeraient' }
  ],
  past_conditional_1: [
    { person: '1s', form: 'j\'aurais aimé' },
    { person: '2s', form: 'tu aurais aimé' },
    { person: '3s', form: 'il/elle aurait aimé' },
    { person: '1p', form: 'nous aurions aimé' },
    { person: '2p', form: 'vous auriez aimé' },
    { person: '3p', form: 'ils/elles auraient aimé' }
  ],
  past_conditional_2: [
    { person: '1s', form: 'j\'eusse aimé' },
    { person: '2s', form: 'tu eusses aimé' },
    { person: '3s', form: 'il/elle eût aimé' },
    { person: '1p', form: 'nous eussions aimé' },
    { person: '2p', form: 'vous eussiez aimé' },
    { person: '3p', form: 'ils/elles eussent aimé' }
  ],
  present_imperative: [
    { person: '2s', form: 'aime' },
    { person: '1p', form: 'aimons' },
    { person: '2p', form: 'aimez' }
  ]
};

// ============================================
// CONJUGAISONS FRANÇAISES - PASSIF
// ============================================

const frenchPassive = {
  present_indicative: [
    { person: '1s', form: 'je suis aimé' },
    { person: '2s', form: 'tu es aimé' },
    { person: '3s', form: 'il/elle est aimé' },
    { person: '1p', form: 'nous sommes aimés' },
    { person: '2p', form: 'vous êtes aimés' },
    { person: '3p', form: 'ils/elles sont aimés' }
  ],
  imperfect_indicative: [
    { person: '1s', form: 'j\'étais aimé' },
    { person: '2s', form: 'tu étais aimé' },
    { person: '3s', form: 'il/elle était aimé' },
    { person: '1p', form: 'nous étions aimés' },
    { person: '2p', form: 'vous étiez aimés' },
    { person: '3p', form: 'ils/elles étaient aimés' }
  ],
  future_indicative: [
    { person: '1s', form: 'je serai aimé' },
    { person: '2s', form: 'tu seras aimé' },
    { person: '3s', form: 'il/elle sera aimé' },
    { person: '1p', form: 'nous serons aimés' },
    { person: '2p', form: 'vous serez aimés' },
    { person: '3p', form: 'ils/elles seront aimés' }
  ],
  simple_past_indicative: [
    { person: '1s', form: 'je fus aimé' },
    { person: '2s', form: 'tu fus aimé' },
    { person: '3s', form: 'il/elle fut aimé' },
    { person: '1p', form: 'nous fûmes aimés' },
    { person: '2p', form: 'vous fûtes aimés' },
    { person: '3p', form: 'ils/elles furent aimés' }
  ],
  compound_past_indicative: [
    { person: '1s', form: 'j\'ai été aimé' },
    { person: '2s', form: 'tu as été aimé' },
    { person: '3s', form: 'il/elle a été aimé' },
    { person: '1p', form: 'nous avons été aimés' },
    { person: '2p', form: 'vous avez été aimés' },
    { person: '3p', form: 'ils/elles ont été aimés' }
  ],
  pluperfect_indicative: [
    { person: '1s', form: 'j\'avais été aimé' },
    { person: '2s', form: 'tu avais été aimé' },
    { person: '3s', form: 'il/elle avait été aimé' },
    { person: '1p', form: 'nous avions été aimés' },
    { person: '2p', form: 'vous aviez été aimés' },
    { person: '3p', form: 'ils/elles avaient été aimés' }
  ],
  past_anterior_indicative: [
    { person: '1s', form: 'j\'eus été aimé' },
    { person: '2s', form: 'tu eus été aimé' },
    { person: '3s', form: 'il/elle eut été aimé' },
    { person: '1p', form: 'nous eûmes été aimés' },
    { person: '2p', form: 'vous eûtes été aimés' },
    { person: '3p', form: 'ils/elles eurent été aimés' }
  ],
  future_anterior_indicative: [
    { person: '1s', form: 'j\'aurai été aimé' },
    { person: '2s', form: 'tu auras été aimé' },
    { person: '3s', form: 'il/elle aura été aimé' },
    { person: '1p', form: 'nous aurons été aimés' },
    { person: '2p', form: 'vous aurez été aimés' },
    { person: '3p', form: 'ils/elles auront été aimés' }
  ],
  present_subjunctive: [
    { person: '1s', form: 'que je sois aimé' },
    { person: '2s', form: 'que tu sois aimé' },
    { person: '3s', form: 'qu\'il/elle soit aimé' },
    { person: '1p', form: 'que nous soyons aimés' },
    { person: '2p', form: 'que vous soyez aimés' },
    { person: '3p', form: 'qu\'ils/elles soient aimés' }
  ],
  imperfect_subjunctive: [
    { person: '1s', form: 'que je fusse aimé' },
    { person: '2s', form: 'que tu fusses aimé' },
    { person: '3s', form: 'qu\'il/elle fût aimé' },
    { person: '1p', form: 'que nous fussions aimés' },
    { person: '2p', form: 'que vous fussiez aimés' },
    { person: '3p', form: 'qu\'ils/elles fussent aimés' }
  ],
  past_subjunctive: [
    { person: '1s', form: 'que j\'aie été aimé' },
    { person: '2s', form: 'que tu aies été aimé' },
    { person: '3s', form: 'qu\'il/elle ait été aimé' },
    { person: '1p', form: 'que nous ayons été aimés' },
    { person: '2p', form: 'que vous ayez été aimés' },
    { person: '3p', form: 'qu\'ils/elles aient été aimés' }
  ],
  pluperfect_subjunctive: [
    { person: '1s', form: 'que j\'eusse été aimé' },
    { person: '2s', form: 'que tu eusses été aimé' },
    { person: '3s', form: 'qu\'il/elle eût été aimé' },
    { person: '1p', form: 'que nous eussions été aimés' },
    { person: '2p', form: 'que vous eussiez été aimés' },
    { person: '3p', form: 'qu\'ils/elles eussent été aimés' }
  ],
  present_conditional: [
    { person: '1s', form: 'je serais aimé' },
    { person: '2s', form: 'tu serais aimé' },
    { person: '3s', form: 'il/elle serait aimé' },
    { person: '1p', form: 'nous serions aimés' },
    { person: '2p', form: 'vous seriez aimés' },
    { person: '3p', form: 'ils/elles seraient aimés' }
  ],
  past_conditional_1: [
    { person: '1s', form: 'j\'aurais été aimé' },
    { person: '2s', form: 'tu aurais été aimé' },
    { person: '3s', form: 'il/elle aurait été aimé' },
    { person: '1p', form: 'nous aurions été aimés' },
    { person: '2p', form: 'vous auriez été aimés' },
    { person: '3p', form: 'ils/elles auraient été aimés' }
  ],
  past_conditional_2: [
    { person: '1s', form: 'j\'eusse été aimé' },
    { person: '2s', form: 'tu eusses été aimé' },
    { person: '3s', form: 'il/elle eût été aimé' },
    { person: '1p', form: 'nous eussions été aimés' },
    { person: '2p', form: 'vous eussiez été aimés' },
    { person: '3p', form: 'ils/elles eussent été aimés' }
  ],
  present_imperative: [
    { person: '2s', form: 'sois aimé' },
    { person: '1p', form: 'soyons aimés' },
    { person: '2p', form: 'soyez aimés' }
  ]
};

// ============================================
// MAPPING DES NOMS DE TEMPS/MODES
// ============================================

const tenseMapping = {
  // Grec
  present_indicative: { tense: 'present', mood: 'indicative' },
  future_indicative: { tense: 'future', mood: 'indicative' },
  aorist_indicative: { tense: 'aorist', mood: 'indicative' },
  imperfect_indicative: { tense: 'imperfect', mood: 'indicative' },
  present_imperative: { tense: 'present', mood: 'imperative' },
  aorist_imperative: { tense: 'aorist', mood: 'imperative' },
  aorist_subjunctive: { tense: 'aorist', mood: 'subjunctive' },
  perfect: { tense: 'perfect', mood: 'indicative' },
  pluperfect: { tense: 'pluperfect', mood: 'indicative' },
  
  // Français
  simple_past_indicative: { tense: 'simple_past', mood: 'indicative' },
  compound_past_indicative: { tense: 'compound_past', mood: 'indicative' },
  pluperfect_indicative: { tense: 'pluperfect', mood: 'indicative' },
  past_anterior_indicative: { tense: 'past_anterior', mood: 'indicative' },
  future_anterior_indicative: { tense: 'future_anterior', mood: 'indicative' },
  present_subjunctive: { tense: 'present', mood: 'subjunctive' },
  imperfect_subjunctive: { tense: 'imperfect', mood: 'subjunctive' },
  past_subjunctive: { tense: 'past', mood: 'subjunctive' },
  pluperfect_subjunctive: { tense: 'pluperfect', mood: 'subjunctive' },
  present_conditional: { tense: 'present', mood: 'conditional' },
  past_conditional_1: { tense: 'past_1', mood: 'conditional' },
  past_conditional_2: { tense: 'past_2', mood: 'conditional' }
};

// ============================================
// FONCTION DE GÉNÉRATION SQL
// ============================================

function generateGreekInserts(conjugations, voice) {
  let sql = `-- ========================================\n`;
  sql += `-- GREC - VOIX ${voice.toUpperCase()}\n`;
  sql += `-- ========================================\n\n`;
  
  for (const [key, forms] of Object.entries(conjugations)) {
    const { tense, mood } = tenseMapping[key] || { tense: key.split('_')[0], mood: key.split('_')[1] || 'indicative' };
    
    sql += `-- ${key.replace(/_/g, ' ').toUpperCase()}\n`;
    for (const form of forms) {
      const escapedForm = form.form.replace(/'/g, "''");
      sql += `INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES\n`;
      sql += `((SELECT id FROM verbs WHERE greek = 'αγαπάω'), '${tense}', '${mood}', '${voice}', '${form.person}', '${escapedForm}');\n`;
    }
    sql += '\n';
  }
  
  return sql;
}

function generateFrenchInserts(conjugations, voice) {
  let sql = `-- ========================================\n`;
  sql += `-- FRANÇAIS - VOIX ${voice.toUpperCase()}\n`;
  sql += `-- ========================================\n\n`;
  
  for (const [key, forms] of Object.entries(conjugations)) {
    const { tense, mood } = tenseMapping[key] || { tense: key.split('_')[0], mood: key.split('_')[1] || 'indicative' };
    
    sql += `-- ${key.replace(/_/g, ' ').toUpperCase()}\n`;
    for (const form of forms) {
      const escapedForm = form.form.replace(/'/g, "''");
      sql += `INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES\n`;
      sql += `((SELECT id FROM verbs WHERE greek = 'αγαπάω'), '${tense}', '${mood}', '${voice}', '${form.person}', '${escapedForm}');\n`;
    }
    sql += '\n';
  }
  
  return sql;
}

// ============================================
// GÉNÉRATION FINALE
// ============================================

console.log(`-- ========================================`);
console.log(`-- CONJUGAISONS COMPLÈTES : αγαπάω / aimer`);
console.log(`-- Généré automatiquement`);
console.log(`-- ========================================\n\n`);

console.log(generateGreekInserts(greekActive, 'active'));
console.log(generateGreekInserts(greekPassive, 'mediopassive'));
console.log(generateFrenchInserts(frenchActive, 'active'));
console.log(generateFrenchInserts(frenchPassive, 'passive'));

console.log(`-- ========================================`);
console.log(`-- FIN DES CONJUGAISONS`);
console.log(`-- ========================================`);