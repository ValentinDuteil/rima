


Concepts · MD
Copier

# 📚 Guide des Concepts - Projet RIMA

> Guide de référence des concepts appris pendant le développement de RIMA (application de conjugaison grecque)

---

## 🎯 Table des matières

1. [Backend vs Frontend](#backend-vs-frontend)
2. [Routes Backend vs Frontend](#routes-backend-vs-frontend)
3. [Query Params vs Body](#query-params-vs-body)
4. [Filtrage côté Client vs Serveur](#filtrage-côté-client-vs-serveur)
5. [SvelteKit - Concepts clés](#sveltekit---concepts-clés)
6. [SQL Dynamique](#sql-dynamique)
7. [Destructuration JavaScript](#destructuration-javascript)
8. [Flux complet des données](#flux-complet-des-données)
9. [CSS Global vs Scopé](#css-global-vs-scopé)

---

## 1. Backend vs Frontend

### 🤔 Définition simple

**Backend = Cuisine d'un restaurant**
- Prépare les données
- Communique avec la base de données
- Invisible pour l'utilisateur

**Frontend = Salle du restaurant**
- Affiche les données
- Interface utilisateur
- Ce que l'utilisateur voit

---

### 📊 Dans le projet RIMA

```
BACKEND (Node.js + Express)
├── Écoute sur port 3000
├── Gère la base de données PostgreSQL
└── Fournit les données via API REST

FRONTEND (SvelteKit)
├── Écoute sur port 5173
├── Affiche l'interface utilisateur
└── Fait des requêtes au backend
```

---

### ✅ Exemple concret

**Afficher la liste des verbes :**

```javascript
// BACKEND (backend/controllers/verbsController.js)
export async function getAllVerbs(req, res, next) {
  const result = await pool.query('SELECT * FROM verbs');
  res.json(result.rows);  // Renvoie JSON au frontend
}

// FRONTEND (frontend/src/routes/+page.server.js)
const response = await fetch('http://localhost:3000/api/verbs');
const verbs = await response.json();  // Reçoit JSON du backend
return { verbs };  // Passe aux composants Svelte
```

---

## 2. Routes Backend vs Frontend

### 🤔 Deux systèmes DIFFÉRENTS

**Routes BACKEND = Cuisine**
- Définit quelles données renvoyer
- URLs API : `/api/verbs`, `/api/verbs/:id`

**Routes FRONTEND = Plan de salle**
- Définit quelles pages afficher
- URLs utilisateur : `/`, `/verbs/5`

---

### 📊 Comparaison

| Aspect | Backend | Frontend |
|--------|---------|----------|
| **Objectif** | Fournir des données JSON | Afficher des pages HTML |
| **URLs** | `/api/verbs` | `/` ou `/verbs/5` |
| **Technologie** | Express Router | SvelteKit (dossiers) |
| **Visible par** | Uniquement le code | L'utilisateur dans le navigateur |

---

### ✅ Exemple RIMA

```
USER : Va sur http://localhost:5173/verbs/5
    ↓
FRONTEND ROUTER : "OK, affiche VerbDetail.svelte"
    ↓
VerbDetail.svelte : "Je vais chercher les données"
    ↓
fetch('http://localhost:3000/api/verbs/5')
    ↓
BACKEND ROUTER : "OK, j'appelle getVerbById()"
    ↓
getVerbById() : Fait requête SQL, renvoie JSON
    ↓
Frontend reçoit les données et les affiche
```

---

## 3. Query Params vs Body

### 🤔 Deux façons de passer des données

**Query Params = Paramètres dans l'URL**
```
GET /api/verbs?sort=greek&group=B1
               ^^^^^^^^^^^^^^^^^^^^
```

**Body = Données dans le corps de la requête**
```javascript
POST /api/users
Content-Type: application/json

{ "username": "valentin", "password": "..." }
```

---

### 📊 Quand utiliser quoi ?

| Méthode HTTP | Paramètres | Usage |
|--------------|------------|-------|
| **GET** | Query params | Récupérer des données (filtres, tri) |
| **POST** | Body | Créer une ressource |
| **PUT/PATCH** | Body | Modifier une ressource |
| **DELETE** | Query params ou URL | Supprimer une ressource |

---

### ✅ Exemples RIMA

**Query params (filtres et tri) :**
```javascript
// Backend
const sortParam = req.query.sort;    // "greek"
const groupParam = req.query.group;  // "B1"

// Frontend
const url = `${API_URL}/api/verbs?sort=${sort}&group=${group}`;
```

**Body (futur - ajout au dictionnaire) :**
```javascript
// POST /api/user-verbs
fetch('/api/user-verbs', {
  method: 'POST',
  body: JSON.stringify({ verb_id: 5, mastery_level: 'beginner' })
});
```

---

## 4. Filtrage côté Client vs Serveur

### 🔴 Côté CLIENT (JavaScript dans le navigateur)

```javascript
// Charge TOUS les verbes
let allVerbs = data.verbs;  // 26 verbes

// Filtre en JavaScript
function filterByGroup(group) {
  const filtered = allVerbs.filter(v => v.group === group);
  displayVerbs(filtered);
}
```

**✅ Avantages :**
- Instantané (pas de requête réseau)
- Simple à coder

**❌ Inconvénients :**
- Charge des données inutiles
- Pas d'URL partageable
- Bouton retour ne marche pas
- Pas indexable par Google

---

### 🟢 Côté SERVEUR (SQL + Backend)

```javascript
// Backend filtre AVANT d'envoyer
GET /api/verbs?group=B1

// SQL
SELECT * FROM verbs WHERE "group" = 'B1'
```

**✅ Avantages :**
- URL partageable : `/?group=B1`
- Bouton retour fonctionne
- Moins de données transférées
- SEO friendly
- Cohérent avec le tri

**❌ Inconvénients :**
- Requête réseau à chaque filtre

---

### 🎯 Choix pour RIMA

**On utilise côté SERVEUR car :**
1. Cohérence (le tri est déjà côté serveur)
2. URLs partageables
3. Prêt pour scale (5000+ verbes)

---

## 5. SvelteKit - Concepts clés

### 📂 Structure des routes

**La magie de SvelteKit : Structure de dossiers = URLs**

```
src/routes/
├── +page.svelte              → URL: /
├── +page.server.js           → Charge données pour /
├── +layout.svelte            → Layout global (toutes pages)
└── verbs/
    └── [id]/
        ├── +page.svelte      → URL: /verbs/:id
        └── +page.server.js   → Charge données pour /verbs/:id
```

**Pas de configuration routes ! Le dossier = l'URL ✨**

---

### 🔧 Fichiers spéciaux

| Fichier | Rôle | S'exécute |
|---------|------|-----------|
| `+page.svelte` | Contenu de la page | Client (navigateur) |
| `+page.server.js` | Charge les données | Serveur (avant envoi) |
| `+layout.svelte` | Layout qui entoure les pages | Client |
| `+error.svelte` | Page d'erreur | Client |

**Le `+` = "fichier spécial SvelteKit"**

---

### 💾 La fonction `load()`

```javascript
// +page.server.js
export async function load({ url }) {
  // 1. S'exécute sur le SERVEUR (pas le navigateur)
  // 2. Peut accéder à l'URL, cookies, etc.
  // 3. Fait des requêtes API
  // 4. Retourne des données
  
  const response = await fetch('http://localhost:3000/api/verbs');
  const verbs = await response.json();
  
  return { verbs };  // Ces données arrivent dans +page.svelte
}
```

---

### 📥 Recevoir les données avec `$props()`

```svelte
<!-- +page.svelte -->
<script>
  let { data } = $props();
  // data = { verbs: [...] }
  // Ce sont les données retournées par load()
</script>

{#each data.verbs as verb}
  <p>{verb.greek}</p>
{/each}
```

---

### 🔄 Le flux complet

```
1. User demande : http://localhost:5173/
   ↓
2. SvelteKit exécute : +page.server.js → load()
   ↓
3. load() fait : fetch('http://localhost:3000/api/verbs')
   ↓
4. Backend renvoie : JSON avec les verbes
   ↓
5. load() retourne : { verbs }
   ↓
6. SvelteKit passe à : +page.svelte via $props()
   ↓
7. +page.svelte affiche : Les verbes dans le HTML
   ↓
8. Navigateur reçoit : Page HTML complète (SSR !)
```

---

## 6. SQL Dynamique

### 🤔 Pourquoi dynamique ?

**Problème :** La requête SQL change selon les paramètres !

```
Sans filtre : SELECT * FROM verbs
Avec filtre : SELECT * FROM verbs WHERE "group" = 'B1'
Avec tri   : SELECT * FROM verbs ORDER BY greek
Les deux   : SELECT * FROM verbs WHERE "group" = 'B1' ORDER BY greek
```

---

### 🔧 Construction progressive

```javascript
// Départ
let sql = 'SELECT * FROM verbs';
const params = [];

// Condition 1 : Filtre groupe
if (req.query.group) {
  sql += ' WHERE "group" = $1';  // Ajoute au texte SQL
  params.push(req.query.group);   // Ajoute la valeur
}

// Condition 2 : Tri
if (req.query.sort === 'greek') {
  sql += ' ORDER BY greek';
}

// Exécution
const result = await pool.query(sql, params);
```

---

### ✅ Exemple concret RIMA

**URL : `/api/verbs?group=B1&sort=greek`**

```javascript
// Étape 1
let sql = 'SELECT * FROM verbs';
const params = [];

// Étape 2 (group = B1)
sql = 'SELECT * FROM verbs WHERE "group" = $1';
params = ['B1'];

// Étape 3 (sort = greek)
sql = 'SELECT * FROM verbs WHERE "group" = $1 ORDER BY greek';
params = ['B1'];

// Résultat final
await pool.query(
  'SELECT * FROM verbs WHERE "group" = $1 ORDER BY greek',
  ['B1']
);
```

---

### ⚠️ IMPORTANT : Ordre SQL

**L'ordre des clauses SQL est STRICT :**

```sql
SELECT ... FROM ... WHERE ... GROUP BY ... ORDER BY ...
```

**❌ Erreur fréquente :**
```sql
SELECT * FROM verbs ORDER BY greek WHERE "group" = 'B1'  -- FAUX !
```

**✅ Correct :**
```sql
SELECT * FROM verbs WHERE "group" = 'B1' ORDER BY greek  -- BON !
```

---

## 7. Destructuration JavaScript

### 🤔 C'est quoi ?

**Extraire des valeurs d'un objet ou tableau**

**Sans destructuration :**
```javascript
const personne = { nom: "Valentin", age: 25 };
const nom = personne.nom;
const age = personne.age;
```

**Avec destructuration :**
```javascript
const { nom, age } = personne;
// nom = "Valentin"
// age = 25
```

---

### ✅ Exemples RIMA

**1. Props Svelte**
```javascript
let { data } = $props();
// Au lieu de : let props = $props(); let data = props.data;
```

**2. Paramètres URL**
```javascript
const { id } = req.params;
// Au lieu de : const id = req.params.id;
```

**3. Résultat fetch**
```javascript
const { verbs, currentSort } = await load();
```

---

### 📊 Destructuration de tableau

```javascript
const letters = ["Α", "Β", "Γ"];

// Sans destructuration
const first = letters[0];
const second = letters[1];

// Avec destructuration
const [first, second] = letters;
// first = "Α"
// second = "Β"
```

---

## 8. Flux complet des données

### 🔄 Du clic utilisateur à l'affichage

```
┌─────────────────────────────────────────────────────────┐
│ 1. USER clique sur "Tri Français"                      │
│    URL change : /?sort=french                           │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 2. FRONTEND SVELTEKIT                                   │
│    +page.server.js : load({ url })                      │
│    - url.searchParams.get('sort') → "french"            │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 3. REQUÊTE API                                          │
│    fetch('http://localhost:3000/api/verbs?sort=french') │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 4. BACKEND EXPRESS                                      │
│    routes/verbs.js → controllers/verbsController.js     │
│    - req.query.sort → "french"                          │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 5. BASE DE DONNÉES POSTGRESQL                          │
│    SELECT * FROM verbs ORDER BY translation             │
│    COLLATE "fr-FR-x-icu"                                │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 6. RÉSULTAT                                             │
│    [{greek: "αγοράζω", translation: "acheter"}, ...]    │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 7. BACKEND RENVOIE                                      │
│    res.json(result.rows)                                │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 8. FRONTEND REÇOIT                                      │
│    const verbs = await response.json()                  │
│    return { verbs }                                     │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 9. COMPOSANT SVELTE                                     │
│    +page.svelte : let { data } = $props()               │
│    {#each data.verbs as verb}                           │
└────────────────────┬────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────────────────┐
│ 10. AFFICHAGE NAVIGATEUR                                │
│     αγοράζω - acheter                                   │
│     αγαπάω - aimer                                      │
│     ...                                                 │
└─────────────────────────────────────────────────────────┘
```

---

## 9. CSS Global vs Scopé

### 🤔 Deux approches complémentaires

**CSS GLOBAL (`app.css`)**
- Variables CSS (couleurs, espacements)
- Reset CSS
- Styles de base (body, html)
- Utilitaires (.container)

**CSS SCOPÉ (dans les composants)**
- Styles spécifiques au composant
- Utilise les variables globales
- Isolé automatiquement par Svelte

---

### 📊 Architecture RIMA

```
src/
├── app.css                      ← Global
│   ├── Reset CSS
│   ├── Variables (:root)
│   └── Utilitaires (.container)
│
└── lib/components/
    ├── Header.svelte            ← Scopé
    │   └── <style> utilise var(--primary)
    └── Footer.svelte            ← Scopé
        └── <style> utilise var(--bg-footer)
```

---

### ✅ Exemple concret

**Global (app.css) :**
```css
:root {
  --primary: #2c3e50;
  --spacing-md: 1rem;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
}
```

**Scopé (Header.svelte) :**
```svelte
<header>
  <div class="container">RIMA</div>
</header>

<style>
  header {
    background: var(--primary);  /* Utilise variable globale */
    padding: var(--spacing-md);
  }
  
  /* Ce style ne s'applique QU'À ce composant */
  .logo {
    font-weight: bold;
  }
</style>
```

---

### ⚡ Pourquoi c'est mieux ?

**Avant (CSS global partout) :**
```css
/* app.css */
.logo { font-weight: bold; }
.header { background: #2c3e50; }
.footer-logo { font-weight: bold; }  /* Duplication ! */
```

**Après (hybride) :**
```css
/* app.css - Juste les variables */
:root { --primary: #2c3e50; }

/* Header.svelte */

  .logo { font-weight: bold; }  /* Pas de conflit avec Footer ! */


/* Footer.svelte */

  .logo { font-weight: bold; }  /* Même nom de classe, pas de conflit ! */

```

**Svelte isole automatiquement les styles de chaque composant !**

---

## 🎓 Récapitulatif des concepts clés

| Concept | En une phrase |
|---------|---------------|
| **Backend** | Cuisine : prépare et gère les données |
| **Frontend** | Salle : affiche l'interface utilisateur |
| **Query params** | Paramètres dans l'URL (?sort=greek) |
| **Body** | Données envoyées dans une requête POST/PUT |
| **Filtre serveur** | Backend filtre en SQL avant d'envoyer |
| **Filtre client** | JavaScript filtre dans le navigateur |
| **load()** | Fonction SvelteKit qui charge les données côté serveur |
| **$props()** | Fonction Svelte 5 pour recevoir les données |
| **SQL dynamique** | Construire la requête SQL en fonction des paramètres |
| **Destructuration** | Extraire des valeurs : `const { nom } = personne` |
| **CSS scopé** | Styles isolés dans chaque composant Svelte |

---

## 📚 Pour aller plus loin

### Documentation officielle

- [SvelteKit Docs](https://kit.svelte.dev/docs)
- [Express.js Guide](https://expressjs.com/en/guide/routing.html)
- [PostgreSQL Tutorial](https://www.postgresql.org/docs/current/tutorial.html)
- [MDN JavaScript](https://developer.mozilla.org/fr/docs/Web/JavaScript)

### Analogies utiles

- **API REST** = Menu de restaurant (liste des plats disponibles)
- **Routes** = Plan de navigation (comment aller où)
- **Query params** = Options de commande (taille, suppléments)
- **Body** = Commande complète (tous les détails)
- **SQL** = Langage pour parler à la base de données
- **Frontend** = Ce que tu vois
- **Backend** = Ce qui se passe en coulisses

---

**💪 Note personnelle :** Ce guide sera enrichi au fur et à mesure de l'apprentissage. N'hésite pas à y revenir régulièrement !

---

**Créé le 28 décembre 2024 - Projet RIMA**