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
      "statement": "CREATE (n:MOVIE {id: $id}) RETURN n",
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
## watchparty
### create watchparty
```
{
  "statements": [
    {
      "statement": "CREATE (n:WATCH PARTY {idFilm: $idFilm}) RETURN n",
      "parameters": {
        "idFilm": "123456",
      }
    }
  ]
}
```
### get watch party
```
{
  "statements": [
    {
      "statement": "MATCH (n:WATCH PARTY {idFilm: $idFilm}) RETURN n",
      "parameters": {
        "idFilm": "123456"
      }
    }
  ]
}
```
