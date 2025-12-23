CREATE TABLE users
(
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE verbs
(
    id SERIAL PRIMARY KEY NOT NULL,
    greek VARCHAR(50) NOT NULL UNIQUE,
    french VARCHAR(50) NOT NULL UNIQUE,
    "group" VARCHAR(50) NOT NULL
);

CREATE TABLE conjugations
(
    id SERIAL PRIMARY KEY NOT NULL,
    verb_id INT NOT NULL,
    tense VARCHAR(50),
    mood VARCHAR(50),
    voice VARCHAR(50),
    person VARCHAR(50),
    form VARCHAR(50),

    CONSTRAINT fk_conjugations_verbs
        foreign key (verb_id)
        REFERENCES verbs(id)
        ON DELETE CASCADE
);

CREATE TABLE user_verbs
(
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    verb_id INT NOT NULL,
    status VARCHAR(20),

    CONSTRAINT fk_user_verbs_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    
    CONSTRAINT fk_user_verbs_verbs
        FOREIGN KEY (verb_id)
        REFERENCES verbs(id)
        ON DELETE CASCADE
);