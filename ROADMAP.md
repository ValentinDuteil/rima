# 🗺️ ROADMAP - Application RIMA (Conjugaison Grecque Moderne)

## Vue d'ensemble du projet

Application web pour apprendre et s'exercer aux conjugaisons en grec moderne, avec dictionnaire personnel, filtres avancés et exercices interactifs.

---

## 📋 PHASES DU PROJET

### ✅ PHASE 0 : Préparation & Conception (TERMINÉE)
- [x] **Étape 0.1 : Analyse des besoins**
- [x] **Étape 0.2 : Choix de la stack technique**
  - Frontend : SvelteKit (Svelte 5)
  - Backend : Node.js + Express
  - BDD : PostgreSQL + pg
  - Auth : JWT (prévu Phase 3)
- [x] **Étape 0.3 : Conception de la base de données**
- [x] **Étape 0.4 : Architecture du projet**

---

### 🎯 PHASE 1 : MVP - Dictionnaire Personnel

#### **1. Setup du projet** ✅ (TERMINÉ)
- [x] **Étape 1.1 : Initialisation backend**
- [x] **Étape 1.2 : Initialisation frontend**
  - Migration vers SvelteKit avec architecture routes/
  - Structure lib/components/ et lib/utils/
- [x] **Étape 1.3 : Configuration PostgreSQL**

#### **2. Base de données** ✅ (TERMINÉ)
- [x] **Étape 2.1 : Création des tables**
  - Tables : verbs, translations, conjugations
- [x] **Étape 2.2 : Insertion des verbes MVP**
  - 26 verbes insérés avec traductions
  - Groupes : A, B1, B2, A/B, être
- [x] **Étape 2.3 : Vérification des données**

#### **3. Backend - API REST** 🔄 (80% TERMINÉ)
- [ ] **Étape 3.1 : Authentification**
  - Non fait (prévu Phase 3)

- [x] **Étape 3.2 : Routes des verbes**
  - GET `/api/verbs` (avec tri et filtres)
  - GET `/api/verbs/:id` (détails d'un verbe)
  - GET `/api/verbs/search?q=...` (recherche FR/GR)
  - GET `/api/verbs/:id/conjugations`

- [ ] **Étape 3.3 : Routes du dictionnaire personnel**
  - Non fait en BDD (localStorage utilisé temporairement)
  - Prévu Phase 4 : Migration localStorage → BDD

#### **4. Frontend - Interface utilisateur** 🔄 (85% TERMINÉ)
- [ ] **Étape 4.1 : Authentification**
  - Non fait (prévu Phase 3)

- [x] **Étape 4.2 : Barre de recherche**
  - Composant `Header.svelte` avec recherche
  - Recherche en temps réel (français ET grec)
  - Dropdown avec résultats
  - Navigation vers les résultats

- [x] **Étape 4.3 : Dictionnaire personnel**
  - ✅ Composant `Sidebar.svelte` complet
  - ✅ Stockage localStorage (IDs uniquement)
  - ✅ Ajout/suppression de verbes via checkboxes
  - ✅ Tri FR/GR dynamique dans la sidebar
  - ✅ Groupement par lettre avec séparateurs graphiques
  - ✅ Inversion affichage grec ↔ français selon tri
  - ✅ Boutons FR/ΕΛ pour changer le tri
  - ✅ Animation slide depuis la droite
  - ✅ Overlay pour fermer
  - [ ] Migration vers BDD (Phase 4)
  - [ ] Gestion du statut (en cours, maîtrisé) - Phase 4

- [ ] **Étape 4.4 : Consultation d'un verbe**
  - Composant `VerbDetails.svelte` (à faire)
  - Page `/verbs/[id]` à créer

- [x] **Étape 4.5 : Filtres & Tri**
  - ✅ Tri français/grec avec URLs propres
  - ✅ Filtres par groupe (A, B1, B2, A/B, Tous)
  - ✅ Séparateurs alphabétiques dynamiques
  - ✅ Fonction mutualisée `groupByFirstLetter()` dans `lib/utils/verbHelpers.js`
  - ✅ Inversion affichage selon tri (homepage + sidebar)

#### **5. Tests & Polish** 🔄 (50% TERMINÉ)
- [x] **Étape 5.1 : Tests fonctionnels de base**
  - ✅ Recherche de verbes
  - ✅ Ajout/retrait au dictionnaire
  - ✅ Filtres et tri
  - [ ] Tests avec auth (Phase 3)

- [x] **Étape 5.2 : Responsive design**
  - ✅ Mobile-first design
  - ✅ Sidebar responsive (pleine largeur sur mobile)
  - ✅ Header responsive

- [ ] **Étape 5.3 : Documentation**
  - [ ] Compléter README.md
  - [ ] Documenter l'architecture
  - [x] Commentaires dans le code

---

### 🔧 REFACTORING & OPTIMISATIONS (À planifier)

#### **Priorité 1 - Code Quality**
- [ ] Créer composant `VerbItem.svelte` pour mutualiser l'affichage
- [ ] Déplacer `.primary` / `.secondary` dans `app.css` (variables globales)
- [ ] Créer `lib/utils/sortHelpers.js` pour mutualiser la logique de tri

#### **Priorité 2 - Features**
- [ ] Migration localStorage → BDD (avec auth)
- [ ] Ajouter loading states pendant les fetch
- [ ] Améliorer animations (sidebar, tri)

#### **Priorité 3 - Tests**
- [ ] Tests unitaires pour `groupByFirstLetter()`
- [ ] Tests E2E avec Playwright
- [ ] Tests d'intégration API

---

### 🚀 PHASE 2 : Expansion de la base de données (À FAIRE)
- [ ] **Script de scraping Wiktionary**
- [ ] **Algorithme de génération pour verbes réguliers**
- [ ] **Ajout des temps** (Futur, Aoriste, Imparfait, Parfait...)
- [ ] **Ajout des modes** (Subjonctif, Impératif)
- [ ] **Ajout des voix** (Médio-passive)

---

### 🎮 PHASE 3 : Authentification & Page Détails (PROCHAINE)
- [ ] **Auth complète**
  - Signup/Login
  - JWT
  - Protection des routes
  - Store utilisateur

- [ ] **Page détails d'un verbe**
  - Route `/verbs/[id]`
  - Affichage conjugaisons
  - Bouton ajouter/retirer du dictionnaire

---

### 🎯 PHASE 4 : Migration localStorage → BDD (APRÈS AUTH)
- [ ] Table `user_verbs`
- [ ] Routes API dictionnaire
- [ ] Migration des données localStorage
- [ ] Statut des verbes (non acquis / en cours / maîtrisé)

---

### 🎮 PHASE 5 : Exercices (APRÈS MVP COMPLET)
- [ ] **Exercice : Conjugaison**
- [ ] **Exercice : Relier les points**
- [ ] **Exercice : Texte à trous**
- [ ] **Exercice : QCM**
- [ ] **Mode mélange aléatoire**

---

### 🚀 PHASES FUTURES
- Gamification & Statistiques
- SRS (Spaced Repetition System)
- Export/Import dictionnaire
- PWA (Progressive Web App)
- Déploiement production

---

## 📊 ÉTAT D'AVANCEMENT GLOBAL

**Phase 0** : ✅ 100% (Terminée)  
**Phase 1** : 🔄 85% (Presque terminée - manque auth + page détails)  
**Phase 2** : ⏳ 0% (Non démarrée)  
**Phase 3** : ⏳ 0% (Non démarrée)  

---

## 📝 Notes importantes

- **Approche pédagogique** : Guidage par questions, pas de code direct (sauf demande explicite)
- **Philosophie** : Comprendre > Aller vite
- **DRY** : Mutualiser le code dès que possible (verbHelpers.js créé !)
- **Documentation** : Tenir à jour cette roadmap + document de transition

---

**Dernière mise à jour** : 9 janvier 2026  
**Version** : 1.2 - Phase 1 à 85%, Sidebar complète  
**Prochaine étape** : Page détails verbe OU Auth (à décider)