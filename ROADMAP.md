# 🗺️ ROADMAP - Application de Conjugaison Grecque Moderne

## Vue d'ensemble du projet

Application web pour apprendre et s'exercer aux conjugaisons en grec moderne, avec dictionnaire personnel, filtres avancés et exercices interactifs.

---

## 📋 PHASES DU PROJET

### ✅ PHASE 0 : Préparation & Conception
- [x] **Étape 0.1 : Analyse des besoins**
  - Définir le scope MVP
  - Lister les fonctionnalités core vs futures
  - Valider les 26 verbes de départ

- [x] **Étape 0.2 : Choix de la stack technique**
  - Frontend : SvelteKit + Vite
  - Backend : Node.js + Express
  - BDD : PostgreSQL + pg
  - Auth : JWT

- [x] **Étape 0.3 : Conception de la base de données**
  - Identifier les entités (verbes, utilisateurs, dictionnaire personnel)
  - Créer le MCD avec Mocodo
  - Générer le MLD
  - Écrire le schéma SQL

- [x] **Étape 0.4 : Architecture du projet**
  - Définir la structure des dossiers backend
  - Définir la structure des dossiers frontend
  - Créer les fichiers de configuration (.gitignore, package.json...)

---

### 🎯 PHASE 1 : MVP - Dictionnaire Personnel (Présent uniquement, voix active)

#### **1. Setup du projet**
- [x] **Étape 1.1 : Initialisation backend**
  - Créer le dossier `backend/`
  - `npm init` + installer dépendances (express, pg, bcrypt, jsonwebtoken, cors, dotenv)
  - Créer `server.js`
  - Tester serveur basique sur port 3000

- [x] **Étape 1.2 : Initialisation frontend**
  - Créer projet SvelteKit avec Vite
  - Structure des dossiers (components, stores, utils)
  - Tester page d'accueil basique

- [x] **Étape 1.3 : Configuration PostgreSQL**
  - Installer PostgreSQL
  - Créer la base de données `conjugaison_grec`
  - Configurer la connexion dans `backend/db/connection.js`
  - Tester la connexion

#### **2. Base de données**
- [x] **Étape 2.1 : Création des tables**
  - Exécuter le schéma SQL (users, verbs, conjugations, user_verbs)
  - Vérifier la création des tables

- [x] **Étape 2.2 : Insertion des verbes MVP**
  - Rentrer le verbe être (catégorie spéciale)
  - Rentrer les 5 verbes groupe A
  - Rentrer les 6 verbes groupe B1
  - Rentrer les 7 verbes groupe B2
  - Rentrer les 7 verbes groupe A/B
  - Total : 26 verbes avec leurs conjugaisons au présent

- [x] **Étape 2.3 : Vérification des données**
  - Tester les requêtes SELECT
  - Vérifier l'intégrité des données

#### **3. Backend - API REST**
- [ ] **Étape 3.1 : Authentification**
  - Route POST `/api/auth/signup` (inscription)
  - Route POST `/api/auth/login` (connexion)
  - Middleware de vérification JWT
  - Tester avec Postman/Thunder Client

- [x] **Étape 3.2 : Routes des verbes**
  - Route GET `/api/verbs` (liste tous les verbes)
  - Route GET `/api/verbs/:id` (détails d'un verbe)
  - Route GET `/api/verbs/search?q=...` (recherche FR/GR)
  - Tester les routes

- [ ] **Étape 3.3 : Routes du dictionnaire personnel**
  - Route GET `/api/user-verbs` (liste du dico perso)
  - Route POST `/api/user-verbs/:verbId` (ajouter au dico)
  - Route DELETE `/api/user-verbs/:verbId` (retirer du dico)
  - Route PATCH `/api/user-verbs/:verbId` (modifier statut)
  - Tester les routes

#### **4. Frontend - Interface utilisateur**
- [ ] **Étape 4.1 : Authentification**
  - Composant `Login.svelte`
  - Composant `Signup.svelte`
  - Store Svelte pour l'utilisateur connecté
  - Gestion du token JWT dans localStorage
  - Redirection si non connecté

- [x] **Étape 4.2 : Barre de recherche**
  - Composant `SearchBar.svelte`
  - Recherche en temps réel (français OU grec)
  - Affichage des résultats
  - Bouton "Ajouter à mon dictionnaire"

- [ ] **Étape 4.3 : Dictionnaire personnel**
  - Composant `UserDictionary.svelte`
  - Liste des verbes ajoutés
  - Bouton retirer du dictionnaire
  - Gestion du statut (en cours, maîtrisé)

- [ ] **Étape 4.4 : Consultation d'un verbe**
  - Composant `VerbDetails.svelte`
  - Affichage de toutes les conjugaisons (présent uniquement)
  - Navigation depuis la recherche ou le dictionnaire

- [ ] **Étape 4.5 : Filtres**
  - Composant `Filters.svelte`
  - Filtre par groupe (A, B1, B2, A/B, être)
  - Filtre par nombre de verbes (tout / X derniers ajoutés)
  - Application des filtres à la liste

#### **5. Tests & Debug**
- [ ] **Étape 5.1 : Tests fonctionnels**
  - Tester l'inscription/connexion
  - Tester la recherche de verbes
  - Tester l'ajout/retrait au dictionnaire
  - Tester les filtres
  - Tester la consultation des conjugaisons

- [ ] **Étape 5.2 : Responsive design**
  - Vérifier sur mobile
  - Vérifier sur tablette
  - Ajuster le CSS si nécessaire

- [ ] **Étape 5.3 : Documentation**
  - Compléter le README.md avec décisions Phase 1
  - Documenter l'architecture
  - Ajouter des commentaires dans le code

---

### 🚀 PHASE 2 : Expansion de la base de données
- [ ] **Script de scraping Wiktionary**
  - Développer le scraper
  - Tester sur 10 verbes
  - Lancer sur 100+ verbes
  
- [ ] **Algorithme de génération**
  - Pour les verbes réguliers
  - Intégration à la BDD

- [ ] **Ajout des temps**
  - Futur
  - Aoriste
  - Imparfait
  - Autres temps (parfait, plus-que-parfait...)

- [ ] **Ajout des modes**
  - Subjonctif
  - Impératif

- [ ] **Ajout des voix**
  - Voix médio-passive (Γ1, Γ2, Γ3, Γ4)

---

### 🎮 PHASE 3 : Exercices
- [ ] **Exercice basique : Conjugaison**
  - "Conjugue [verbe] au [temps] à la [personne]"
  - Vérification de la réponse
  - Feedback correct/incorrect

- [ ] **Exercice : Relier les points**
  - Verbe grec ↔ Traduction française

- [ ] **Exercice : Texte à trous**
  - Phrases avec conjugaisons manquantes

- [ ] **Exercice : QCM**
  - Choix multiples

- [ ] **Mode mélange**
  - Alternance aléatoire des types d'exercices

---

### 🚀 PHASES SUIVANTES (À définir)

**Phase 4 et au-delà** :
- Gamification & Statistiques
- Contenu pédagogique
- UX/UI avancée
- Autres fonctionnalités (SRS, export/import, PWA...)
- Déploiement en production

*(Ces phases seront détaillées au fur et à mesure de l'avancement du projet)*

---

## 📝 Notes

- **Philosophie** : Avancer étape par étape, valider chaque phase avant de passer à la suivante
- **Priorité** : Comprendre > Aller vite
- **Documentation** : Documenter les décisions au fur et à mesure dans README.md
- **Tests** : Tester chaque fonctionnalité avant de continuer

---

**Dernière mise à jour** : 20 décembre 2024
**Version** : 1.0 - MVP en cours
