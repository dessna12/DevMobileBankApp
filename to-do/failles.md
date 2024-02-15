# Failles de sécurité

<blockquote>

## Faille d'injection SQL

Le code laisse passer des injections SQL, car il n'a pas vérifié le contenu de la donnée fournie par l'utilisateur. Il faut faire des requêtes préparées ou utiliser un bon ORM peut aider à limiter les failles d'injection. 

- fichier `index.ts`
- ligne 48 & 89

``` ts 
    const query = `SELECT * FROM users WHERE username = '${req.body.username}' AND password = '${req.body.password}'`; // Ici on injecte directement la donnée brute récupérée sans filtre ni validation dans notre requête SQL. 
    const {rows: users} = await database.query(query);
[...]
const query = `INSERT INTO todos (content, user_id) VALUES ($1, $2)`;

```
</blockquote>

<blockquote>

## Mots de passe faibles

Le mots de passe et User name choisis sont trop faibles. Ils peuvent facilement être deviné lors d'une attaque par force brute. 

- fichier `.env`
- ligne 4 & 5

```env
DB_USER=todo-user           // on évite user dans le username. 
DB_PASSWORD=todo-password   // On ne met pas password dans un mot de passe. Il faut un mot de passe complexe, long de préférence qui ne veut rien dire et qui mélange lettre, chiffres et caractères spéciaux. 
```

Les username admin et mot de passe admin sont trop faibles également. 

- fichier `init.sql`
- ligne 15

```slq
INSERT INTO users (username, password) VALUES ('admin', 'admin');
```

</blockquote>

<blockquote>

## Routes non protégées

Certaines routes avec des requêtes POST et DELETE devraient demander des autorisations admin, or elles ne sont pas protégées. N'importe qui fait des tests sur les routes, peuvent les deviner. 
Il faut ajouter un middleware qui permet de vérifier le user et d'accorder l'accès à la route ou non. 

- fichier `index.ts`
- ligne 85, 115

```ts 
// Route correspondant à la suppression d'un todo
app.get("/removeTodo/:id", async function (req, res) {
});

// Route correspondant à la soumission du formulaire d'ajout de todo
app.post("/addTodo", async function (req, res) {
});

// Route correspondant à la modification d'un todo
app.post("/updateTodo/:id", async function (req, res) {
});
```

</blockquote>

<blockquote>

## Mots de passe non chiffrés

Si un hackeur accède à la database il peut lire en clair les mots de passe et identifiants d'un grand nombre d'utilisateurs. Il faut chiffrer les mots de passe avec un algorithme puissant avant de les stocker dans la base de données. 

- fichier : init.sql
- ligne 6

```sql 
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR( 255 )  NOT NULL,
    password VARCHAR( 255 )  NOT NULL // Should be encrypted by a strong algorithm. 
);

```

</blockquote>