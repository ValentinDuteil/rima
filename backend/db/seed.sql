-- ========================================
-- SEED DATA - MVP avec 26 verbes
-- Présent de l'indicatif actif uniquement
-- ========================================

-- ========================================
-- VERBE ÊTRE (catégorie spéciale)
-- ========================================

INSERT INTO verbs (greek, "group") VALUES ('είμαι', 'etre');

INSERT INTO translations (verb_id, language, translation) 
VALUES (
    (SELECT id FROM verbs WHERE greek = 'είμαι'),
    'français',
    'être'
);

INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '1s', 'είμαι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '2s', 'είσαι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '3s', 'είναι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '1p', 'είμαστε'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '2p', 'είστε'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '3p', 'είναι');

-- ========================================
-- GROUPE A (5 verbes)
-- ========================================

-- γράφω (écrire)
INSERT INTO verbs (greek, "group") VALUES ('γράφω', 'A');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'γράφω'), 'français', 'écrire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '1s', 'γράφω'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '2s', 'γράφεις'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '3s', 'γράφει'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '1p', 'γράφουμε'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '2p', 'γράφετε'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '3p', 'γράφουν');

-- διαβάζω (lire)
INSERT INTO verbs (greek, "group") VALUES ('διαβάζω', 'A');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'français', 'lire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '1s', 'διαβάζω'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '2s', 'διαβάζεις'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '3s', 'διαβάζει'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '1p', 'διαβάζουμε'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '2p', 'διαβάζετε'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '3p', 'διαβάζουν');

-- πίνω (boire)
INSERT INTO verbs (greek, "group") VALUES ('πίνω', 'A');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'πίνω'), 'français', 'boire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '1s', 'πίνω'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '2s', 'πίνεις'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '3s', 'πίνει'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '1p', 'πίνουμε'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '2p', 'πίνετε'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '3p', 'πίνουν');

-- κλείνω (fermer)
INSERT INTO verbs (greek, "group") VALUES ('κλείνω', 'A');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'français', 'fermer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '1s', 'κλείνω'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '2s', 'κλείνεις'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '3s', 'κλείνει'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '1p', 'κλείνουμε'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '2p', 'κλείνετε'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '3p', 'κλείνουν');

-- αγοράζω (acheter)
INSERT INTO verbs (greek, "group") VALUES ('αγοράζω', 'A');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'français', 'acheter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '1s', 'αγοράζω'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '2s', 'αγοράζεις'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '3s', 'αγοράζει'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '1p', 'αγοράζουμε'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '2p', 'αγοράζετε'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '3p', 'αγοράζουν');

-- ========================================
-- GROUPE B1 (6 verbes)
-- ========================================

-- μιλάω (parler)
INSERT INTO verbs (greek, "group") VALUES ('μιλάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'français', 'parler');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '1s', 'μιλάω'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '2s', 'μιλάς'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3s', 'μιλάει'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '1p', 'μιλάμε'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '2p', 'μιλάτε'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3p', 'μιλάνε');

-- αγαπάω (aimer)
INSERT INTO verbs (greek, "group") VALUES ('αγαπάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'français', 'aimer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '1s', 'αγαπάω'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '2s', 'αγαπάς'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '3s', 'αγαπάει'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '1p', 'αγαπάμε'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '2p', 'αγαπάτε'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '3p', 'αγαπάνε');

-- ζητάω (demander)
INSERT INTO verbs (greek, "group") VALUES ('ζητάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'français', 'demander');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '1s', 'ζητάω'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '2s', 'ζητάς'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3s', 'ζητάει'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '1p', 'ζητάμε'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '2p', 'ζητάτε'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3p', 'ζητάνε');

-- σταματάω (s'arrêter)
INSERT INTO verbs (greek, "group") VALUES ('σταματάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'français', 's''arrêter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '1s', 'σταματάω'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '2s', 'σταματάς'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3s', 'σταματάει'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '1p', 'σταματάμε'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '2p', 'σταματάτε'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3p', 'σταματάνε');

-- πονάω (avoir mal)
INSERT INTO verbs (greek, "group") VALUES ('πονάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'πονάω'), 'français', 'avoir mal');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '1s', 'πονάω'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '2s', 'πονάς'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3s', 'πονάει'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '1p', 'πονάμε'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '2p', 'πονάτε'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3p', 'πονάνε');

-- συναντάω (rencontrer)
INSERT INTO verbs (greek, "group") VALUES ('συναντάω', 'B1');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'français', 'rencontrer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '1s', 'συναντάω'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '2s', 'συναντάς'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3s', 'συναντάει'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '1p', 'συναντάμε'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '2p', 'συναντάτε'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3p', 'συναντάνε');

-- ========================================
-- GROUPE B2 (7 verbes)
-- ========================================

-- ζω (vivre)
INSERT INTO verbs (greek, "group") VALUES ('ζω', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'ζω'), 'français', 'vivre');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '1s', 'ζω'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '2s', 'ζεις'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '3s', 'ζει'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '1p', 'ζούμε'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '2p', 'ζείτε'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '3p', 'ζουν');

-- παρακαλώ (prier/demander)
INSERT INTO verbs (greek, "group") VALUES ('παρακαλώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'français', 'prier');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '1s', 'παρακαλώ'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '2s', 'παρακαλείς'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '3s', 'παρακαλεί'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '1p', 'παρακαλούμε'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '2p', 'παρακαλείτε'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '3p', 'παρακαλούν');

-- καλώ (inviter)
INSERT INTO verbs (greek, "group") VALUES ('καλώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'καλώ'), 'français', 'inviter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '1s', 'καλώ'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '2s', 'καλείς'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '3s', 'καλεί'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '1p', 'καλούμε'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '2p', 'καλείτε'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '3p', 'καλούν');

-- χρησιμοποιώ (utiliser)
INSERT INTO verbs (greek, "group") VALUES ('χρησιμοποιώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'français', 'utiliser');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '1s', 'χρησιμοποιώ'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '2s', 'χρησιμοποιείς'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '3s', 'χρησιμοποιεί'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '1p', 'χρησιμοποιούμε'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '2p', 'χρησιμοποιείτε'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '3p', 'χρησιμοποιούν');

-- συμφωνώ (être d'accord)
INSERT INTO verbs (greek, "group") VALUES ('συμφωνώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'français', 'être d''accord');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '1s', 'συμφωνώ'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '2s', 'συμφωνείς'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '3s', 'συμφωνεί'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '1p', 'συμφωνούμε'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '2p', 'συμφωνείτε'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '3p', 'συμφωνούν');

-- τηλεφωνώ (téléphoner)
INSERT INTO verbs (greek, "group") VALUES ('τηλεφωνώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'français', 'téléphoner');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '1s', 'τηλεφωνώ'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '2s', 'τηλεφωνείς'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '3s', 'τηλεφωνεί'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '1p', 'τηλεφωνούμε'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '2p', 'τηλεφωνείτε'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '3p', 'τηλεφωνούν');

-- αργώ (tarder)
INSERT INTO verbs (greek, "group") VALUES ('αργώ', 'B2');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'αργώ'), 'français', 'tarder');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '1s', 'αργώ'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '2s', 'αργείς'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '3s', 'αργεί'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '1p', 'αργούμε'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '2p', 'αργείτε'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '3p', 'αργούν');

-- ========================================
-- GROUPE A/B (7 verbes irréguliers)
-- ========================================

-- ακούω (écouter)
INSERT INTO verbs (greek, "group") VALUES ('ακούω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'ακούω'), 'français', 'écouter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '1s', 'ακούω'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '2s', 'ακούς'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '3s', 'ακούει'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '1p', 'ακούμε'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '2p', 'ακούτε'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '3p', 'ακούνε');

-- λέω (dire)
INSERT INTO verbs (greek, "group") VALUES ('λέω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'λέω'), 'français', 'dire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '1s', 'λέω'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '2s', 'λες'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '3s', 'λέει'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '1p', 'λέμε'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '2p', 'λέτε'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '3p', 'λένε');

-- τρώω (manger)
INSERT INTO verbs (greek, "group") VALUES ('τρώω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'τρώω'), 'français', 'manger');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '1s', 'τρώω'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '2s', 'τρως'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '3s', 'τρώει'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '1p', 'τρώμε'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '2p', 'τρώτε'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '3p', 'τρώνε');

-- κλαίω (pleurer)
INSERT INTO verbs (greek, "group") VALUES ('κλαίω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'français', 'pleurer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '1s', 'κλαίω'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '2s', 'κλαις'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '3s', 'κλαίει'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '1p', 'κλαίμε'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '2p', 'κλαίτε'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '3p', 'κλαίνε');

-- καίω (brûler)
INSERT INTO verbs (greek, "group") VALUES ('καίω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'καίω'), 'français', 'brûler');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '1s', 'καίω'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '2s', 'καις'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '3s', 'καίει'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '1p', 'καίμε'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '2p', 'καίτε'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '3p', 'καίνε');

-- πάω (aller)
INSERT INTO verbs (greek, "group") VALUES ('πάω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'πάω'), 'français', 'aller');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '1s', 'πάω'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '2s', 'πας'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '3s', 'πάει'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '1p', 'πάμε'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '2p', 'πάτε'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '3p', 'πάνε');

-- φταίω (c'est de ma faute)
INSERT INTO verbs (greek, "group") VALUES ('φταίω', 'A/B');
INSERT INTO translations (verb_id, language, translation) 
VALUES ((SELECT id FROM verbs WHERE greek = 'φταίω'), 'français', 'c''est de ma faute');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '1s', 'φταίω'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '2s', 'φταις'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '3s', 'φταίει'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '1p', 'φταίμε'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '2p', 'φταίτε'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '3p', 'φταίνε');