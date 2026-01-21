-- ========================================
-- RIMA - SEEDER COMPLET
-- Base de données pour l'apprentissage du grec moderne
-- ========================================

-- ========================================
-- NETTOYAGE
-- ========================================

DROP TABLE IF EXISTS french_conjugations CASCADE;
DROP TABLE IF EXISTS conjugations CASCADE;
DROP TABLE IF EXISTS translations CASCADE;
DROP TABLE IF EXISTS verbs CASCADE;

-- ========================================
-- CRÉATION DES TABLES
-- ========================================

CREATE TABLE verbs (
    id SERIAL PRIMARY KEY,
    greek VARCHAR(100) NOT NULL UNIQUE,
    "group" VARCHAR(50),
    is_irregular BOOLEAN DEFAULT FALSE
);

CREATE TABLE translations (
    id SERIAL PRIMARY KEY,
    verb_id INTEGER NOT NULL,
    language VARCHAR(50) NOT NULL,
    translation VARCHAR(100) NOT NULL,
    CONSTRAINT fk_translations_verbs FOREIGN KEY (verb_id) REFERENCES verbs(id) ON DELETE CASCADE
);

CREATE TABLE conjugations (
    id SERIAL PRIMARY KEY,
    verb_id INTEGER NOT NULL,
    tense VARCHAR(50),
    mood VARCHAR(50),
    voice VARCHAR(50),
    person VARCHAR(50),
    form VARCHAR(50),
    is_alternative_form BOOLEAN DEFAULT FALSE,
    variant_group VARCHAR(20) DEFAULT 'contracted',
    CONSTRAINT fk_conjugations_verbs FOREIGN KEY (verb_id) REFERENCES verbs(id) ON DELETE CASCADE
);

CREATE TABLE french_conjugations (
    id SERIAL PRIMARY KEY,
    verb_id INTEGER,
    tense VARCHAR(50) NOT NULL,
    mood VARCHAR(50) NOT NULL,
    person VARCHAR(10),
    form VARCHAR(100) NOT NULL,
    voice VARCHAR(50),
    is_alternative_form BOOLEAN DEFAULT FALSE,
    variant_group VARCHAR(20) DEFAULT 'standard',
    CONSTRAINT french_conjugations_verb_id_fkey FOREIGN KEY (verb_id) REFERENCES verbs(id) ON DELETE CASCADE
);

-- ========================================
-- VERBE ÊTRE (catégorie spéciale)
-- ========================================

INSERT INTO verbs (greek, "group", is_irregular) VALUES ('είμαι', 'etre', TRUE);

INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'français', 'être');

INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '1s', 'είμαι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '2s', 'είσαι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '3s', 'είναι'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '1p', 'είμαστε'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '2p', 'είστε'),
((SELECT id FROM verbs WHERE greek = 'είμαι'), 'present', 'indicative', 'active', '3p', 'είναι');

-- ========================================
-- GROUPE A (5 verbes) - Présent uniquement
-- ========================================

-- γράφω (écrire)
INSERT INTO verbs (greek, "group") VALUES ('γράφω', 'A');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'français', 'écrire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '1s', 'γράφω'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '2s', 'γράφεις'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '3s', 'γράφει'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '1p', 'γράφουμε'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '2p', 'γράφετε'),
((SELECT id FROM verbs WHERE greek = 'γράφω'), 'present', 'indicative', 'active', '3p', 'γράφουν');

-- διαβάζω (lire)
INSERT INTO verbs (greek, "group") VALUES ('διαβάζω', 'A');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'français', 'lire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '1s', 'διαβάζω'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '2s', 'διαβάζεις'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '3s', 'διαβάζει'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '1p', 'διαβάζουμε'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '2p', 'διαβάζετε'),
((SELECT id FROM verbs WHERE greek = 'διαβάζω'), 'present', 'indicative', 'active', '3p', 'διαβάζουν');

-- πίνω (boire)
INSERT INTO verbs (greek, "group") VALUES ('πίνω', 'A');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'français', 'boire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '1s', 'πίνω'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '2s', 'πίνεις'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '3s', 'πίνει'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '1p', 'πίνουμε'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '2p', 'πίνετε'),
((SELECT id FROM verbs WHERE greek = 'πίνω'), 'present', 'indicative', 'active', '3p', 'πίνουν');

-- κλείνω (fermer)
INSERT INTO verbs (greek, "group") VALUES ('κλείνω', 'A');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'français', 'fermer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '1s', 'κλείνω'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '2s', 'κλείνεις'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '3s', 'κλείνει'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '1p', 'κλείνουμε'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '2p', 'κλείνετε'),
((SELECT id FROM verbs WHERE greek = 'κλείνω'), 'present', 'indicative', 'active', '3p', 'κλείνουν');

-- αγοράζω (acheter)
INSERT INTO verbs (greek, "group") VALUES ('αγοράζω', 'A');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'français', 'acheter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '1s', 'αγοράζω'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '2s', 'αγοράζεις'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '3s', 'αγοράζει'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '1p', 'αγοράζουμε'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '2p', 'αγοράζετε'),
((SELECT id FROM verbs WHERE greek = 'αγοράζω'), 'present', 'indicative', 'active', '3p', 'αγοράζουν');

-- ========================================
-- GROUPE B1 (6 verbes) - Présent uniquement
-- Note: αγαπάω sera complété plus loin
-- ========================================

-- μιλάω (parler)
INSERT INTO verbs (greek, "group") VALUES ('μιλάω', 'B1');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'français', 'parler');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '1s', 'μιλάω'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '2s', 'μιλάς'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3s', 'μιλάει'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3s', 'μιλά'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '1p', 'μιλάμε'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '2p', 'μιλάτε'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3p', 'μιλάνε'),
((SELECT id FROM verbs WHERE greek = 'μιλάω'), 'present', 'indicative', 'active', '3p', 'μιλούν');

-- ζητάω (demander)
INSERT INTO verbs (greek, "group") VALUES ('ζητάω', 'B1');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'français', 'demander');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '1s', 'ζητάω'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '2s', 'ζητάς'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3s', 'ζητάει'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3s', 'ζητά'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '1p', 'ζητάμε'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '2p', 'ζητάτε'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3p', 'ζητάνε'),
((SELECT id FROM verbs WHERE greek = 'ζητάω'), 'present', 'indicative', 'active', '3p', 'ζητούν');

-- σταματάω (s'arrêter)
INSERT INTO verbs (greek, "group") VALUES ('σταματάω', 'B1');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'français', 's''arrêter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '1s', 'σταματάω'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '2s', 'σταματάς'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3s', 'σταματάει'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3s', 'σταματά'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '1p', 'σταματάμε'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '2p', 'σταματάτε'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3p', 'σταματάνε'),
((SELECT id FROM verbs WHERE greek = 'σταματάω'), 'present', 'indicative', 'active', '3p', 'σταματούν');

-- πονάω (avoir mal)
INSERT INTO verbs (greek, "group") VALUES ('πονάω', 'B1');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'français', 'avoir mal');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '1s', 'πονάω'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '2s', 'πονάς'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3s', 'πονάει'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3s', 'πονά'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '1p', 'πονάμε'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '2p', 'πονάτε'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3p', 'πονάνε'),
((SELECT id FROM verbs WHERE greek = 'πονάω'), 'present', 'indicative', 'active', '3p', 'πονούν');

-- συναντάω (rencontrer)
INSERT INTO verbs (greek, "group") VALUES ('συναντάω', 'B1');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'français', 'rencontrer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '1s', 'συναντάω'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '2s', 'συναντάς'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3s', 'συναντάει'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3s', 'συναντά'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '1p', 'συναντάμε'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '2p', 'συναντάτε'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3p', 'συναντάνε'),
((SELECT id FROM verbs WHERE greek = 'συναντάω'), 'present', 'indicative', 'active', '3p', 'συναντούν');

-- ========================================
-- GROUPE B2 (7 verbes) - Présent uniquement
-- ========================================

-- ζω (vivre)
INSERT INTO verbs (greek, "group") VALUES ('ζω', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'ζω'), 'français', 'vivre');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '1s', 'ζω'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '2s', 'ζεις'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '3s', 'ζει'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '1p', 'ζούμε'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '2p', 'ζείτε'),
((SELECT id FROM verbs WHERE greek = 'ζω'), 'present', 'indicative', 'active', '3p', 'ζουν');

-- παρακαλώ (prier/demander)
INSERT INTO verbs (greek, "group") VALUES ('παρακαλώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'français', 'prier');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '1s', 'παρακαλώ'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '2s', 'παρακαλείς'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '3s', 'παρακαλεί'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '1p', 'παρακαλούμε'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '2p', 'παρακαλείτε'),
((SELECT id FROM verbs WHERE greek = 'παρακαλώ'), 'present', 'indicative', 'active', '3p', 'παρακαλούν');

-- καλώ (inviter)
INSERT INTO verbs (greek, "group") VALUES ('καλώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'français', 'inviter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '1s', 'καλώ'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '2s', 'καλείς'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '3s', 'καλεί'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '1p', 'καλούμε'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '2p', 'καλείτε'),
((SELECT id FROM verbs WHERE greek = 'καλώ'), 'present', 'indicative', 'active', '3p', 'καλούν');

-- χρησιμοποιώ (utiliser)
INSERT INTO verbs (greek, "group") VALUES ('χρησιμοποιώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'français', 'utiliser');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '1s', 'χρησιμοποιώ'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '2s', 'χρησιμοποιείς'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '3s', 'χρησιμοποιεί'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '1p', 'χρησιμοποιούμε'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '2p', 'χρησιμοποιείτε'),
((SELECT id FROM verbs WHERE greek = 'χρησιμοποιώ'), 'present', 'indicative', 'active', '3p', 'χρησιμοποιούν');

-- συμφωνώ (être d'accord)
INSERT INTO verbs (greek, "group") VALUES ('συμφωνώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'français', 'être d''accord');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '1s', 'συμφωνώ'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '2s', 'συμφωνείς'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '3s', 'συμφωνεί'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '1p', 'συμφωνούμε'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '2p', 'συμφωνείτε'),
((SELECT id FROM verbs WHERE greek = 'συμφωνώ'), 'present', 'indicative', 'active', '3p', 'συμφωνούν');

-- τηλεφωνώ (téléphoner)
INSERT INTO verbs (greek, "group") VALUES ('τηλεφωνώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'français', 'téléphoner');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '1s', 'τηλεφωνώ'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '2s', 'τηλεφωνείς'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '3s', 'τηλεφωνεί'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '1p', 'τηλεφωνούμε'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '2p', 'τηλεφωνείτε'),
((SELECT id FROM verbs WHERE greek = 'τηλεφωνώ'), 'present', 'indicative', 'active', '3p', 'τηλεφωνούν');

-- αργώ (tarder)
INSERT INTO verbs (greek, "group") VALUES ('αργώ', 'B2');
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'français', 'tarder');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '1s', 'αργώ'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '2s', 'αργείς'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '3s', 'αργεί'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '1p', 'αργούμε'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '2p', 'αργείτε'),
((SELECT id FROM verbs WHERE greek = 'αργώ'), 'present', 'indicative', 'active', '3p', 'αργούν');

-- ========================================
-- GROUPE A/B (7 verbes irréguliers) - Présent uniquement
-- ========================================

-- ακούω (écouter)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('ακούω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'français', 'écouter');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '1s', 'ακούω'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '2s', 'ακούς'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '3s', 'ακούει'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '1p', 'ακούμε'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '2p', 'ακούτε'),
((SELECT id FROM verbs WHERE greek = 'ακούω'), 'present', 'indicative', 'active', '3p', 'ακούνε');

-- λέω (dire)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('λέω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'λέω'), 'français', 'dire');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '1s', 'λέω'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '2s', 'λες'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '3s', 'λέει'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '1p', 'λέμε'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '2p', 'λέτε'),
((SELECT id FROM verbs WHERE greek = 'λέω'), 'present', 'indicative', 'active', '3p', 'λένε');

-- τρώω (manger)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('τρώω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'français', 'manger');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '1s', 'τρώω'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '2s', 'τρως'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '3s', 'τρώει'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '1p', 'τρώμε'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '2p', 'τρώτε'),
((SELECT id FROM verbs WHERE greek = 'τρώω'), 'present', 'indicative', 'active', '3p', 'τρώνε');

-- κλαίω (pleurer)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('κλαίω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'français', 'pleurer');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '1s', 'κλαίω'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '2s', 'κλαις'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '3s', 'κλαίει'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '1p', 'κλαίμε'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '2p', 'κλαίτε'),
((SELECT id FROM verbs WHERE greek = 'κλαίω'), 'present', 'indicative', 'active', '3p', 'κλαίνε');

-- καίω (brûler)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('καίω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'καίω'), 'français', 'brûler');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '1s', 'καίω'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '2s', 'καις'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '3s', 'καίει'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '1p', 'καίμε'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '2p', 'καίτε'),
((SELECT id FROM verbs WHERE greek = 'καίω'), 'present', 'indicative', 'active', '3p', 'καίνε');

-- πάω (aller)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('πάω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'πάω'), 'français', 'aller');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '1s', 'πάω'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '2s', 'πας'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '3s', 'πάει'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '1p', 'πάμε'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '2p', 'πάτε'),
((SELECT id FROM verbs WHERE greek = 'πάω'), 'present', 'indicative', 'active', '3p', 'πάνε');

-- φταίω (c'est de ma faute)
INSERT INTO verbs (greek, "group", is_irregular) VALUES ('φταίω', 'A/B', TRUE);
INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'français', 'être fautif');
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '1s', 'φταίω'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '2s', 'φταις'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '3s', 'φταίει'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '1p', 'φταίμε'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '2p', 'φταίτε'),
((SELECT id FROM verbs WHERE greek = 'φταίω'), 'present', 'indicative', 'active', '3p', 'φταίνε');

-- ========================================
-- VERBE: αγαπάω / αγαπώ (aimer) - ID 26
-- Conjugaisons COMPLÈTES avec toutes les variantes
-- ========================================

INSERT INTO verbs (greek, "group", is_irregular) VALUES ('αγαπάω', 'B1', false);

INSERT INTO translations (verb_id, language, translation) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'français', 'aimer');

-- ========================================
-- 1. PRÉSENT INDICATIF ACTIF
-- ========================================

-- Groupe 'contracted' (formes principales basées sur αγαπώ)
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'indicative', 'active', '1s', 'αγαπώ', false, 'contracted'),
    (26, 'present', 'indicative', 'active', '2s', 'αγαπάς', false, 'contracted'),
    (26, 'present', 'indicative', 'active', '3s', 'αγαπά', false, 'contracted'),
    (26, 'present', 'indicative', 'active', '1p', 'αγαπούμε', false, 'contracted'),
    (26, 'present', 'indicative', 'active', '2p', 'αγαπάτε', false, 'contracted'),
    (26, 'present', 'indicative', 'active', '3p', 'αγαπούν', false, 'contracted'),
    
    -- Formes alternatives 'contracted' (variante avec -νε mobile)
    (26, 'present', 'indicative', 'active', '3p', 'αγαπούνε', true, 'contracted'),
    
    -- Groupe 'modern' (formes alternatives basées sur αγαπάω)
    (26, 'present', 'indicative', 'active', '1s', 'αγαπάω', true, 'modern'),
    (26, 'present', 'indicative', 'active', '3s', 'αγαπάει', true, 'modern'),
    (26, 'present', 'indicative', 'active', '1p', 'αγαπάμε', true, 'modern'),
    (26, 'present', 'indicative', 'active', '3p', 'αγαπάνε', true, 'modern');

-- ========================================
-- 2. IMPARFAIT INDICATIF ACTIF
-- ========================================

-- Groupe 'modern_ousa' (Le plus courant à l'oral)
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'imperfect', 'indicative', 'active', '1s', 'αγαπούσα', false, 'modern_ousa'),
    (26, 'imperfect', 'indicative', 'active', '2s', 'αγαπούσες', false, 'modern_ousa'),
    (26, 'imperfect', 'indicative', 'active', '3s', 'αγαπούσε', false, 'modern_ousa'),
    (26, 'imperfect', 'indicative', 'active', '1p', 'αγαπούσαμε', false, 'modern_ousa'),
    (26, 'imperfect', 'indicative', 'active', '2p', 'αγαπούσατε', false, 'modern_ousa'),
    (26, 'imperfect', 'indicative', 'active', '3p', 'αγαπούσαν', false, 'modern_ousa'),
    
    -- Variante avec -νε mobile pour modern_ousa
    (26, 'imperfect', 'indicative', 'active', '3p', 'αγαπούσανε', true, 'modern_ousa');

-- Groupe 'traditional_aga' (Variante très utilisée)
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'imperfect', 'indicative', 'active', '1s', 'αγάπαγα', true, 'traditional_aga'),
    (26, 'imperfect', 'indicative', 'active', '2s', 'αγάπαγες', true, 'traditional_aga'),
    (26, 'imperfect', 'indicative', 'active', '3s', 'αγάπαγε', true, 'traditional_aga'),
    (26, 'imperfect', 'indicative', 'active', '1p', 'αγαπάγαμε', true, 'traditional_aga'),
    (26, 'imperfect', 'indicative', 'active', '2p', 'αγαπάγατε', true, 'traditional_aga'),
    (26, 'imperfect', 'indicative', 'active', '3p', 'αγάπαγαν', true, 'traditional_aga'),
    
    -- Variante avec -νε mobile pour traditional_aga
    (26, 'imperfect', 'indicative', 'active', '3p', 'αγαπάγανε', true, 'traditional_aga');

-- ========================================
-- 3. AORISTE (PASSÉ SIMPLE) INDICATIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'aorist', 'indicative', 'active', '1s', 'αγάπησα', false, 'standard'),
    (26, 'aorist', 'indicative', 'active', '2s', 'αγάπησες', false, 'standard'),
    (26, 'aorist', 'indicative', 'active', '3s', 'αγάπησε', false, 'standard'),
    (26, 'aorist', 'indicative', 'active', '1p', 'αγαπήσαμε', false, 'standard'),
    (26, 'aorist', 'indicative', 'active', '2p', 'αγαπήσατε', false, 'standard'),
    (26, 'aorist', 'indicative', 'active', '3p', 'αγάπησαν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'aorist', 'indicative', 'active', '3p', 'αγάπησανε', true, 'movable_ne');

-- ========================================
-- 4. FUTUR INDICATIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'future', 'indicative', 'active', '1s', 'θα αγαπήσω', false, 'standard'),
    (26, 'future', 'indicative', 'active', '2s', 'θα αγαπήσεις', false, 'standard'),
    (26, 'future', 'indicative', 'active', '3s', 'θα αγαπήσει', false, 'standard'),
    (26, 'future', 'indicative', 'active', '1p', 'θα αγαπήσουμε', false, 'standard'),
    (26, 'future', 'indicative', 'active', '2p', 'θα αγαπήσετε', false, 'standard'),
    (26, 'future', 'indicative', 'active', '3p', 'θα αγαπήσουν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'future', 'indicative', 'active', '3p', 'θα αγαπήσουνε', true, 'movable_ne');

-- ========================================
-- 5. PARFAIT INDICATIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'perfect', 'indicative', 'active', '1s', 'έχω αγαπήσει', false, 'standard'),
    (26, 'perfect', 'indicative', 'active', '2s', 'έχεις αγαπήσει', false, 'standard'),
    (26, 'perfect', 'indicative', 'active', '3s', 'έχει αγαπήσει', false, 'standard'),
    (26, 'perfect', 'indicative', 'active', '1p', 'έχουμε αγαπήσει', false, 'standard'),
    (26, 'perfect', 'indicative', 'active', '2p', 'έχετε αγαπήσει', false, 'standard'),
    (26, 'perfect', 'indicative', 'active', '3p', 'έχουν αγαπήσει', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'perfect', 'indicative', 'active', '3p', 'έχουνε αγαπήσει', true, 'movable_ne');

-- ========================================
-- 6. PLUS-QUE-PARFAIT INDICATIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'pluperfect', 'indicative', 'active', '1s', 'είχα αγαπήσει', false, 'standard'),
    (26, 'pluperfect', 'indicative', 'active', '2s', 'είχες αγαπήσει', false, 'standard'),
    (26, 'pluperfect', 'indicative', 'active', '3s', 'είχε αγαπήσει', false, 'standard'),
    (26, 'pluperfect', 'indicative', 'active', '1p', 'είχαμε αγαπήσει', false, 'standard'),
    (26, 'pluperfect', 'indicative', 'active', '2p', 'είχατε αγαπήσει', false, 'standard'),
    (26, 'pluperfect', 'indicative', 'active', '3p', 'είχαν αγαπήσει', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'pluperfect', 'indicative', 'active', '3p', 'είχανε αγαπήσει', true, 'movable_ne');

-- ========================================
-- 7. PRÉSENT SUBJONCTIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'subjunctive', 'active', '1s', 'να αγαπώ', false, 'standard'),
    (26, 'present', 'subjunctive', 'active', '2s', 'να αγαπάς', false, 'standard'),
    (26, 'present', 'subjunctive', 'active', '3s', 'να αγαπά', false, 'standard'),
    (26, 'present', 'subjunctive', 'active', '1p', 'να αγαπούμε', false, 'standard'),
    (26, 'present', 'subjunctive', 'active', '2p', 'να αγαπάτε', false, 'standard'),
    (26, 'present', 'subjunctive', 'active', '3p', 'να αγαπούν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'present', 'subjunctive', 'active', '3p', 'να αγαπούνε', true, 'movable_ne');

-- ========================================
-- 8. AORISTE SUBJONCTIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'aorist', 'subjunctive', 'active', '1s', 'να αγαπήσω', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'active', '2s', 'να αγαπήσεις', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'active', '3s', 'να αγαπήσει', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'active', '1p', 'να αγαπήσουμε', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'active', '2p', 'να αγαπήσετε', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'active', '3p', 'να αγαπήσουν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'aorist', 'subjunctive', 'active', '3p', 'να αγαπήσουνε', true, 'movable_ne');

-- ========================================
-- 9. IMPÉRATIF ACTIF
-- ========================================

-- Groupe 'standard' (Aoriste)
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'aorist', 'imperative', 'active', '2s', 'αγάπησε', false, 'standard'),
    (26, 'aorist', 'imperative', 'active', '2p', 'αγαπήστε', false, 'standard'),
    
    -- Forme archaïque/formelle
    (26, 'aorist', 'imperative', 'active', '2p', 'αγαπήσατε', true, 'formal');

-- Groupe 'standard' (Présent continu)
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'imperative', 'active', '2s', 'αγάπα', false, 'standard'),
    (26, 'present', 'imperative', 'active', '2p', 'αγαπάτε', false, 'standard');

-- ========================================
-- 10. INFINITIF ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'infinitive', 'active', NULL, 'αγαπάω', false, 'standard'),
    (26, 'aorist', 'infinitive', 'active', NULL, 'αγαπήσει', false, 'standard');

-- ========================================
-- 11. PARTICIPE ACTIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'participle', 'active', NULL, 'αγαπώντας', false, 'standard');

-- ========================================
-- 12. PRÉSENT INDICATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'indicative', 'mediopassive', '1s', 'αγαπιέμαι', false, 'standard'),
    (26, 'present', 'indicative', 'mediopassive', '2s', 'αγαπιέσαι', false, 'standard'),
    (26, 'present', 'indicative', 'mediopassive', '3s', 'αγαπιέται', false, 'standard'),
    (26, 'present', 'indicative', 'mediopassive', '1p', 'αγαπιόμαστε', false, 'standard'),
    (26, 'present', 'indicative', 'mediopassive', '2p', 'αγαπιέστε', false, 'standard'),
    (26, 'present', 'indicative', 'mediopassive', '3p', 'αγαπιούνται', false, 'standard'),
    
    -- Variantes familières/orales
    (26, 'present', 'indicative', 'mediopassive', '2p', 'αγαπιόσαστε', true, 'oral'),
    (26, 'present', 'indicative', 'mediopassive', '3p', 'αγαπιούνε', true, 'movable_ne');

-- ========================================
-- 13. IMPARFAIT INDICATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'imperfect', 'indicative', 'mediopassive', '1s', 'αγαπιόμουν', false, 'standard'),
    (26, 'imperfect', 'indicative', 'mediopassive', '2s', 'αγαπιόσουν', false, 'standard'),
    (26, 'imperfect', 'indicative', 'mediopassive', '3s', 'αγαπιόταν', false, 'standard'),
    (26, 'imperfect', 'indicative', 'mediopassive', '1p', 'αγαπιόμασταν', false, 'standard'),
    (26, 'imperfect', 'indicative', 'mediopassive', '2p', 'αγαπιόσασταν', false, 'standard'),
    (26, 'imperfect', 'indicative', 'mediopassive', '3p', 'αγαπιόντουσαν', false, 'standard'),
    
    -- Variantes
    (26, 'imperfect', 'indicative', 'mediopassive', '3p', 'αγαπιόνταν', true, 'contracted');

-- ========================================
-- 14. AORISTE INDICATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'aorist', 'indicative', 'mediopassive', '1s', 'αγαπήθηκα', false, 'standard'),
    (26, 'aorist', 'indicative', 'mediopassive', '2s', 'αγαπήθηκες', false, 'standard'),
    (26, 'aorist', 'indicative', 'mediopassive', '3s', 'αγαπήθηκε', false, 'standard'),
    (26, 'aorist', 'indicative', 'mediopassive', '1p', 'αγαπηθήκαμε', false, 'standard'),
    (26, 'aorist', 'indicative', 'mediopassive', '2p', 'αγαπηθήκατε', false, 'standard'),
    (26, 'aorist', 'indicative', 'mediopassive', '3p', 'αγαπήθηκαν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'aorist', 'indicative', 'mediopassive', '3p', 'αγαπήθηκανε', true, 'movable_ne');

-- ========================================
-- 15. FUTUR INDICATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'future', 'indicative', 'mediopassive', '1s', 'θα αγαπηθώ', false, 'standard'),
    (26, 'future', 'indicative', 'mediopassive', '2s', 'θα αγαπηθείς', false, 'standard'),
    (26, 'future', 'indicative', 'mediopassive', '3s', 'θα αγαπηθεί', false, 'standard'),
    (26, 'future', 'indicative', 'mediopassive', '1p', 'θα αγαπηθούμε', false, 'standard'),
    (26, 'future', 'indicative', 'mediopassive', '2p', 'θα αγαπηθείτε', false, 'standard'),
    (26, 'future', 'indicative', 'mediopassive', '3p', 'θα αγαπηθούν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'future', 'indicative', 'mediopassive', '3p', 'θα αγαπηθούνε', true, 'movable_ne');

-- ========================================
-- 16. PARFAIT INDICATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'perfect', 'indicative', 'mediopassive', '1s', 'έχω αγαπηθεί', false, 'standard'),
    (26, 'perfect', 'indicative', 'mediopassive', '2s', 'έχεις αγαπηθεί', false, 'standard'),
    (26, 'perfect', 'indicative', 'mediopassive', '3s', 'έχει αγαπηθεί', false, 'standard'),
    (26, 'perfect', 'indicative', 'mediopassive', '1p', 'έχουμε αγαπηθεί', false, 'standard'),
    (26, 'perfect', 'indicative', 'mediopassive', '2p', 'έχετε αγαπηθεί', false, 'standard'),
    (26, 'perfect', 'indicative', 'mediopassive', '3p', 'έχουν αγαπηθεί', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'perfect', 'indicative', 'mediopassive', '3p', 'έχουνε αγαπηθεί', true, 'movable_ne');

-- ========================================
-- 17. PRÉSENT SUBJONCTIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'subjunctive', 'mediopassive', '1s', 'να αγαπιέμαι', false, 'standard'),
    (26, 'present', 'subjunctive', 'mediopassive', '2s', 'να αγαπιέσαι', false, 'standard'),
    (26, 'present', 'subjunctive', 'mediopassive', '3s', 'να αγαπιέται', false, 'standard'),
    (26, 'present', 'subjunctive', 'mediopassive', '1p', 'να αγαπιόμαστε', false, 'standard'),
    (26, 'present', 'subjunctive', 'mediopassive', '2p', 'να αγαπιέστε', false, 'standard'),
    (26, 'present', 'subjunctive', 'mediopassive', '3p', 'να αγαπιούνται', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'present', 'subjunctive', 'mediopassive', '3p', 'να αγαπιούνε', true, 'movable_ne');

-- ========================================
-- 18. AORISTE SUBJONCTIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'aorist', 'subjunctive', 'mediopassive', '1s', 'να αγαπηθώ', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'mediopassive', '2s', 'να αγαπηθείς', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'mediopassive', '3s', 'να αγαπηθεί', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'mediopassive', '1p', 'να αγαπηθούμε', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'mediopassive', '2p', 'να αγαπηθείτε', false, 'standard'),
    (26, 'aorist', 'subjunctive', 'mediopassive', '3p', 'να αγαπηθούν', false, 'standard'),
    
    -- Variante mobile -νε
    (26, 'aorist', 'subjunctive', 'mediopassive', '3p', 'να αγαπηθούνε', true, 'movable_ne');

-- ========================================
-- 19. IMPÉRATIF MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'imperative', 'mediopassive', '2s', 'αγαπιέσαι', false, 'standard'),
    (26, 'present', 'imperative', 'mediopassive', '2p', 'αγαπιέστε', false, 'standard'),
    (26, 'aorist', 'imperative', 'mediopassive', '2s', 'αγαπήσου', false, 'standard'),
    (26, 'aorist', 'imperative', 'mediopassive', '2p', 'αγαπηθείτε', false, 'standard');

-- ========================================
-- 20. PARTICIPE MÉDIO-PASSIF
-- ========================================

-- Groupe 'standard'
INSERT INTO conjugations (verb_id, tense, mood, voice, person, form, is_alternative_form, variant_group)
VALUES 
    (26, 'present', 'participle', 'mediopassive', NULL, 'αγαπιόμενος', false, 'standard'),
    (26, 'perfect', 'participle', 'mediopassive', NULL, 'αγαπημένος', false, 'standard');

-- ========================================
-- FRANÇAIS ACTIF - TOUS LES TEMPS
-- ========================================

-- FRANÇAIS - FORMES NOMINALES (INFINITIF & PARTICIPE)
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
-- Infinitifs
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'infinitive', 'active', NULL, 'aimer'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'infinitive', 'active', NULL, 'avoir aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'infinitive', 'passive', NULL, 'être aimé'),

-- Participes
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'participle', 'active', NULL, 'aimant'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'participle', 'active', 'ms', 'aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'participle', 'passive', NULL, 'étant aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'participle', 'passive', NULL, 'ayant été aimé');

-- FRANÇAIS ACTIF - PRÉSENT INDICATIF
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '1s', 'j''aime'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '2s', 'tu aimes'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '3s', 'il/elle aime'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '1p', 'nous aimons'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '2p', 'vous aimez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'active', '3p', 'ils/elles aiment');

-- FRANÇAIS ACTIF - IMPARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '1s', 'j''aimais'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '2s', 'tu aimais'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '3s', 'il/elle aimait'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '1p', 'nous aimions'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '2p', 'vous aimiez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'active', '3p', 'ils/elles aimaient');

-- FRANÇAIS ACTIF - FUTUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '1s', 'j''aimerai'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '2s', 'tu aimeras'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '3s', 'il/elle aimera'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '1p', 'nous aimerons'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '2p', 'vous aimerez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'active', '3p', 'ils/elles aimeront');

-- FRANÇAIS ACTIF - PASSÉ SIMPLE
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '1s', 'j''aimai'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '2s', 'tu aimas'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '3s', 'il/elle aima'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '1p', 'nous aimâmes'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '2p', 'vous aimâtes'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'active', '3p', 'ils/elles aimèrent');

-- FRANÇAIS ACTIF - PASSÉ COMPOSÉ
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '1s', 'j''ai aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '2s', 'tu as aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '3s', 'il/elle a aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '1p', 'nous avons aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '2p', 'vous avez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'active', '3p', 'ils/elles ont aimé');

-- FRANÇAIS ACTIF - PLUS-QUE-PARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '1s', 'j''avais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '2s', 'tu avais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '3s', 'il/elle avait aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '1p', 'nous avions aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '2p', 'vous aviez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'active', '3p', 'ils/elles avaient aimé');

-- FRANÇAIS ACTIF - PASSÉ ANTÉRIEUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '1s', 'j''eus aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '2s', 'tu eus aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '3s', 'il/elle eut aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '1p', 'nous eûmes aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '2p', 'vous eûtes aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'active', '3p', 'ils/elles eurent aimé');

-- FRANÇAIS ACTIF - FUTUR ANTÉRIEUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '1s', 'j''aurai aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '2s', 'tu auras aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '3s', 'il/elle aura aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '1p', 'nous aurons aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '2p', 'vous aurez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'active', '3p', 'ils/elles auront aimé');

-- FRANÇAIS ACTIF - SUBJONCTIF PRÉSENT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '1s', 'que j''aime'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '2s', 'que tu aimes'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '3s', 'qu''il/elle aime'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '1p', 'que nous aimions'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '2p', 'que vous aimiez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'active', '3p', 'qu''ils/elles aiment');

-- FRANÇAIS ACTIF - SUBJONCTIF IMPARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '1s', 'que j''aimasse'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '2s', 'que tu aimasses'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '3s', 'qu''il/elle aimât'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '1p', 'que nous aimassions'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '2p', 'que vous aimassiez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'active', '3p', 'qu''ils/elles aimassent');

-- FRANÇAIS ACTIF - SUBJONCTIF PASSÉ
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '1s', 'que j''aie aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '2s', 'que tu aies aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '3s', 'qu''il/elle ait aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '1p', 'que nous ayons aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '2p', 'que vous ayez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'active', '3p', 'qu''ils/elles aient aimé');

-- FRANÇAIS ACTIF - SUBJONCTIF PLUS-QUE-PARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '1s', 'que j''eusse aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '2s', 'que tu eusses aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '3s', 'qu''il/elle eût aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '1p', 'que nous eussions aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '2p', 'que vous eussiez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'active', '3p', 'qu''ils/elles eussent aimé');

-- FRANÇAIS ACTIF - CONDITIONNEL PRÉSENT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '1s', 'j''aimerais'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '2s', 'tu aimerais'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '3s', 'il/elle aimerait'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '1p', 'nous aimerions'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '2p', 'vous aimeriez'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'active', '3p', 'ils/elles aimeraient');

-- FRANÇAIS ACTIF - CONDITIONNEL PASSÉ 1
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '1s', 'j''aurais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '2s', 'tu aurais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '3s', 'il/elle aurait aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '1p', 'nous aurions aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '2p', 'vous auriez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'active', '3p', 'ils/elles auraient aimé');

-- FRANÇAIS ACTIF - CONDITIONNEL PASSÉ 2
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '1s', 'j''eusse aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '2s', 'tu eusses aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '3s', 'il/elle eût aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '1p', 'nous eussions aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '2p', 'vous eussiez aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'active', '3p', 'ils/elles eussent aimé');

-- FRANÇAIS ACTIF - IMPÉRATIF
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'active', '2s', 'aime'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'active', '1p', 'aimons'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'active', '2p', 'aimez');
-- ========================================
-- FRANÇAIS PASSIF - TOUS LES TEMPS
-- ========================================

-- FRANÇAIS PASSIF - PRÉSENT INDICATIF
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '1s', 'je suis aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '2s', 'tu es aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '3s', 'il/elle est aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '1p', 'nous sommes aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '2p', 'vous êtes aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'indicative', 'passive', '3p', 'ils/elles sont aimés');

-- FRANÇAIS PASSIF - IMPARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '1s', 'j''étais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '2s', 'tu étais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '3s', 'il/elle était aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '1p', 'nous étions aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '2p', 'vous étiez aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'indicative', 'passive', '3p', 'ils/elles étaient aimés');

-- FRANÇAIS PASSIF - FUTUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '1s', 'je serai aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '2s', 'tu seras aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '3s', 'il/elle sera aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '1p', 'nous serons aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '2p', 'vous serez aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future', 'indicative', 'passive', '3p', 'ils/elles seront aimés');

-- FRANÇAIS PASSIF - PASSÉ SIMPLE
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '1s', 'je fus aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '2s', 'tu fus aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '3s', 'il/elle fut aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '1p', 'nous fûmes aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '2p', 'vous fûtes aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'simple_past', 'indicative', 'passive', '3p', 'ils/elles furent aimés');

-- FRANÇAIS PASSIF - PASSÉ COMPOSÉ
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '1s', 'j''ai été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '2s', 'tu as été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '3s', 'il/elle a été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '1p', 'nous avons été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '2p', 'vous avez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'compound_past', 'indicative', 'passive', '3p', 'ils/elles ont été aimés');

-- FRANÇAIS PASSIF - PLUS-QUE-PARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '1s', 'j''avais été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '2s', 'tu avais été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '3s', 'il/elle avait été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '1p', 'nous avions été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '2p', 'vous aviez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'indicative', 'passive', '3p', 'ils/elles avaient été aimés');

-- FRANÇAIS PASSIF - PASSÉ ANTÉRIEUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '1s', 'j''eus été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '2s', 'tu eus été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '3s', 'il/elle eut été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '1p', 'nous eûmes été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '2p', 'vous eûtes été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_anterior', 'indicative', 'passive', '3p', 'ils/elles eurent été aimés');

-- FRANÇAIS PASSIF - FUTUR ANTÉRIEUR
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '1s', 'j''aurai été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '2s', 'tu auras été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '3s', 'il/elle aura été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '1p', 'nous aurons été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '2p', 'vous aurez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'future_anterior', 'indicative', 'passive', '3p', 'ils/elles auront été aimés');

-- FRANÇAIS PASSIF - SUBJONCTIF PRÉSENT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '1s', 'que je sois aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '2s', 'que tu sois aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '3s', 'qu''il/elle soit aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '1p', 'que nous soyons aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '2p', 'que vous soyez aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'subjunctive', 'passive', '3p', 'qu''ils/elles soient aimés');

-- FRANÇAIS PASSIF - SUBJONCTIF IMPARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '1s', 'que je fusse aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '2s', 'que tu fusses aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '3s', 'qu''il/elle fût aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '1p', 'que nous fussions aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '2p', 'que vous fussiez aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'imperfect', 'subjunctive', 'passive', '3p', 'qu''ils/elles fussent aimés');

-- FRANÇAIS PASSIF - SUBJONCTIF PASSÉ
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '1s', 'que j''aie été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '2s', 'que tu aies été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '3s', 'qu''il/elle ait été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '1p', 'que nous ayons été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '2p', 'que vous ayez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past', 'subjunctive', 'passive', '3p', 'qu''ils/elles aient été aimés');

-- FRANÇAIS PASSIF - SUBJONCTIF PLUS-QUE-PARFAIT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '1s', 'que j''eusse été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '2s', 'que tu eusses été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '3s', 'qu''il/elle eût été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '1p', 'que nous eussions été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '2p', 'que vous eussiez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'pluperfect', 'subjunctive', 'passive', '3p', 'qu''ils/elles eussent été aimés');

-- FRANÇAIS PASSIF - CONDITIONNEL PRÉSENT
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '1s', 'je serais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '2s', 'tu serais aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '3s', 'il/elle serait aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '1p', 'nous serions aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '2p', 'vous seriez aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'conditional', 'passive', '3p', 'ils/elles seraient aimés');

-- FRANÇAIS PASSIF - CONDITIONNEL PASSÉ 1
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '1s', 'j''aurais été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '2s', 'tu aurais été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '3s', 'il/elle aurait été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '1p', 'nous aurions été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '2p', 'vous auriez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_1', 'conditional', 'passive', '3p', 'ils/elles auraient été aimés');

-- FRANÇAIS PASSIF - CONDITIONNEL PASSÉ 2
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '1s', 'j''eusse été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '2s', 'tu eusses été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '3s', 'il/elle eût été aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '1p', 'nous eussions été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '2p', 'vous eussiez été aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'past_2', 'conditional', 'passive', '3p', 'ils/elles eussent été aimés');

-- FRANÇAIS PASSIF - IMPÉRATIF
INSERT INTO french_conjugations (verb_id, tense, mood, voice, person, form) VALUES
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'passive', '2s', 'sois aimé'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'passive', '1p', 'soyons aimés'),
((SELECT id FROM verbs WHERE greek = 'αγαπάω'), 'present', 'imperative', 'passive', '2p', 'soyez aimés');

-- ========================================
-- PERMISSIONS POUR RIMA1
-- ========================================

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO rima1;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO rima1;

-- ========================================
-- FIN DU SEEDER
-- ========================================
