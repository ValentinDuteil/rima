# 🇬🇷 Application de Conjugaison Grecque Moderne

Application web pour apprendre et s'exercer aux conjugaisons en grec moderne, avec dictionnaire personnel, filtres avancés et exercices interactifs.

---

## 🎯 Objectif du projet

Créer un outil pédagogique pour mémoriser les conjugaisons grecques modernes, avec :
- Dictionnaire personnel de verbes
- Consultation des conjugaisons
- Filtres par groupe grammatical
- Exercices interactifs (phases futures)

**Philosophie** : Apprendre en construisant un projet utile et documenté.

---

## 📋 PHASE 0 : Préparation & Décisions

### Stack technique choisie

**Frontend**
- **Svelte + Vite** : Framework léger et réactif, déjà vu en formation, parfait pour des petites applications
- **CSS Vanilla** : Maîtrise des bases avant d'ajouter des frameworks CSS

**Backend**
- **Node.js + Express** : Framework déjà connu, simple et efficace pour créer une API REST
- **JWT** : Authentification token-based, pas de gestion de sessions complexes

**Base de données**
- **PostgreSQL** : Base relationnelle robuste, standard dans l'industrie
- **pg (node-postgres)** : Requêtes SQL directes pour mieux comprendre ce qui se passe (pas d'ORM pour le MVP)

**Pourquoi ces choix ?**
- ✅ Technologies déjà vues en formation → révision et approfondissement
- ✅ Stack simple et cohérente → focus sur la logique métier
- ✅ SQL natif → meilleure compréhension de la BDD
- ✅ Pas de complexité inutile pour un MVP

### Scope MVP (Phase 1)

**Fonctionnalités core** :
- Authentification (signup/login)
- Dictionnaire personnel (26 verbes de départ)
- Recherche de verbes (français/grec)
- Consultation des conjugaisons
- Filtres par groupe grammatical

**Limitations volontaires** :
- Présent uniquement (voix active)
- 26 verbes seulement (1 être + 5 A + 6 B1 + 7 B2 + 7 A/B)
- Pas d'exercices dans le MVP
- Pas de voix médio-passive (Γ1-4)

**Raison** : Valider l'architecture et les fonctionnalités de base avec peu de données avant d'élargir.

### Classification des verbes (grec moderne)

**Voix active** :
- **Groupe A** : verbes en -ω, accent avant-dernière syllabe (ex: γράφω, διαβάζω)
- **Groupe B1** : verbes en -άω, accent sur l'alpha (ex: μιλάω, αγαπάω)
- **Groupe B2** : verbes en -ω/-ώ, accent dernière syllabe (ex: καλώ, ζω)
- **Groupe A/B** : 7 verbes irréguliers (ακούω, λέω, τρώω, κλαίω, καίω, πάω, φταίω)

**Voix médio-passive** (phase future) :
- Γ1, Γ2, Γ3, Γ4

**Verbe être** : Catégorie à part (είμαι)

### Conception de la base de données

**MCD/MLD** : À créer avec Mocodo

**Entités identifiées** :
- `users` : Utilisateurs de l'application
- `verbs` : Base de données des verbes grecs
- `conjugations` : Conjugaisons des verbes par temps/mode/voix
- `user_verbs` : Dictionnaire personnel (relation users ↔ verbs)

**Relations** :
- Un utilisateur peut avoir plusieurs verbes dans son dictionnaire (N:N)
- Un verbe a plusieurs conjugaisons (1:N)

---

## 📋 PHASE 1 : MVP - Dictionnaire Personnel

*(À documenter au fur et à mesure de l'implémentation)*

**Décisions prises** :
- ...

**Difficultés rencontrées** :
- ...

**Solutions apportées** :
- ...

---

## 📋 PHASE 2 : Expansion de la BDD

*(Phase future - À documenter)*

---

## 📋 PHASE 3 : Exercices

*(Phase future - À documenter)*

---

## 📋 PHASES SUIVANTES

- Gamification & statistiques
- Contenu pédagogique
- UX/UI avancée
- Fonctionnalités avancées
- Déploiement en production

---

## 🛠️ Installation & Lancement

*(À compléter lors du développement)*

---

## 📚 Ressources

**Manuel de référence** :
- "Grec Moderne - Conjugaison et grammaire" (Ellipses, A2-B1)

**Sources de données** :
- Classification grammaticale du manuel Ellipses
- Conjugaisons : Wiktionary (scraping prévu en Phase 2)

---

## 🤝 Développement avec IA

Ce projet est développé avec l'assistance de Claude (Anthropic) comme mentor technique :
- Guidance sur l'architecture
- Aide à la compréhension des concepts
- Revue de code et suggestions

**Approche pédagogique** : Comprendre chaque étape plutôt que copier-coller du code.

---

**Dernière mise à jour** : 20 décembre 2024  
**Statut** : Phase 0 en cours - Conception de la BDD
