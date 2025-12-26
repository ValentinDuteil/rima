INSERT INTO verbs (greek, "group") VALUES ('αγαπάω', 'B1');

INSERT INTO translations (verb_id, language, translation) 
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'), 
        'fr', 
        'aimer');

INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) 
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '1s',
        'αγαπάω');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) 
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπάς');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form)
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπάει');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) 
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπά');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form)
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπάμε');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form)
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπάτε');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form)
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπάνε');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form)
    VALUES (
        (SELECT id FROM verbs WHERE greek = 'αγαπάω'),
        'present',
        'indicative',
        'active',
        '2s',
        'αγαπούν');