## Run the database : 
```
docker build -t neo4j-watchit .  
```
then
```
docker run -p 7687:7687 -p 7474:7474 --name watchit-database neo4j-watchit
```