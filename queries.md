## User
### create user
```
{
  "statements": [
    {
      "statement": "CREATE (n:USER {username: $username, email: $email, hashedpw: $hashedpw, image: $image}) RETURN n",
      "parameters": {
        "username": "John Doe",
        "email": "email@example.com",
        "hashedpw": "hashedpw",
        "image": "base64encodedimage"
      }
    }
  ]
}
```

### get user by username
```
{
  "statements": [
    {
      "statement": "MATCH (n:USER {username: $username}) RETURN n",
      "parameters": {
        "username": "John Doe"
      }
    }
  ]
}
```

### delete user by username
```
{
  "statements": [
    {
      "statement": "MATCH (n:USER {username: $username}) DELETE n",
      "parameters": {
        "username": "John Doe"
      }
    }
  ]
}
```
### update user by username
```
{
  "statements": [
    {
      "statement": "MATCH (n:USER {username: $username}) SET n.username = $newusername, n.email = $newemail, n.hashedpw = $newhashedpw, n.image = $newimage RETURN n",
      "parameters": {
        "username": "John Doe",
        "newusername": "Jane Doe",
        "newemail": "email@example.com",
        "newhashedpw": "hashedpw",
        "newimage": "base64encodedimage"
        }
    }
    ]
}
```
## Movie
### create movie
```
{
  "statements": [
    {
      "statement": "MERGE (n:MOVIE {id: $id}) RETURN n",
      "parameters": {
        "id": "123456"
      }
    }
  ]
}
```
### get movie by id, create if not exists
```
{
  "statements": [
    {
      "statement": "MERGE (n:MOVIE {id: $id}) RETURN n",
      "parameters": {
        "id": "123456"
      }
    }
  ]
}
```
## WATCH_PARTY
### create WATCH_PARTY
```
{
  "statements": [
    {
      "statement": "MATCH (user:USER) WHERE user.username = $owner
CREATE (user)-[r:Created {date: $date}]->(n:WATCH_PARTY {idFilm: $idFilm}) RETURN n",
      "parameters": {
        "owner": "Alice",
        "date": "28-08-2023",
        "idFilm": "123456"
      }
    }
  ]
}
```
### get WATCH_PARTY based on film id
```
{
  "statements": [
    {
      "statement": "MATCH (n:WATCH_PARTY {idFilm: $idFilm}) RETURN n",
      "parameters": {
        "idFilm": "123456"
      }
    }
  ]
}
```


## Relationships

### create friendship

```
{
  "statements": [
    {
      "statement": "MATCH (a:USER), (b:USER) WHERE a.username = "Fred" AND b.username = "Alice" MERGE (a)-[r:Friend_With {date: $date}]->(b)",
      "parameters": {
        "user1": "Alice",
        "user2": "Fred",
        "date": "28-08-2023"
      }
    }
  ]
}
```
### create Watched

```
{
  "statements": [
    {
      "statement": "MATCH (a:USER), (b:MOVIE) WHERE a.username = $idUser AND b.id = $idFilm MERGE (a)-[r:Watched {date: $date}]->(b)",
      "parameters": {
        "idUser": "Alice",
        "idFilm": "12345",
        "date": "28-08-2023"
      }
    }
  ]
}
```
### create Rated

```
{
  "statements": [
    {
      "statement": "MATCH (a:USER), (b:MOVIE) WHERE a.username = $idUser AND b.id = $idFilm MERGE (a)-[r:Rated {date: $date, rating: $rating}]->(b)",
      "parameters": {
        "idUser": "Alice",
        "idFilm": "12345",
        "date": "28-08-2023",
        "rating": 3
      }
    }
  ]
}
```


### create chated

```
{
  "statements": [
    {
      "statement": "MATCH (a:USER)-[:Created]->(c:WATCH_PARTY), (b:USER)  
      WHERE a.username = $owner AND c.idFilm = $idFilm AND b.username = $user
      MERGE (b)-[r:Chated {date: $date, content: $content}]->(c)",
      "parameters": {
        "owner": "Alice",
        "idFilm": "23456",
        "user": "Fred",
        "date": "24-03-2023",
        "content": "trop bien"
      }
    }
  ]
}
```

### get friend's movies

```
{
  "statements": [
    {
      "statement": "
        MATCH (a:USER)-[:Friend_With]->(b:USER)-[:Watched]->(c:MOVIE) 
        WHERE a.username = $user1 AND b.username = $user2
        RETURN c",
      "parameters": {
        "user1": "Alice",
        "user2": "Fred",
      }
    }
  ]
}
```


### get number of friend that watched this movies

```
{
  "statements": [
    {
      "statement": "
        MATCH (a:USER)-[:Friend_With]->(b:USER)-[:Watched]->(c:MOVIE)
        WHERE a.username = $user1 AND c.id = $idFilm
        RETURN COUNT(b)",
      "parameters": {
        "user1": "Alice",
        "idFilm": 12345,
      }
    }
  ]
}
```

### get number of commun movies with friends

