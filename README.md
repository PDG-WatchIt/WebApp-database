# WebApp - Database
## Prérequis
- Docker
## Lancer la base de données : 
- Executer la commande suivante à la racine du projet :

    ```
    docker build -t neo4j-watchit .  
    ```
- Ensuite :

    ```
    docker run -p 7687:7687 -p 7474:7474 --name watchit-database neo4j-watchit
    ```
- La GUI est accessible à l'adresse suivante : http://localhost:7474/

- Utilisateur/mot de passe : neo4j/secret

## Mettre en place un dataset fictif :

- Exécuter les queries du fichier creation_queries.txt dans navigateur neo4j