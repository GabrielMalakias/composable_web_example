## Composable web

Just a example on how to use function composition in ruby to have a more functional programming approach

### Running

```sh
docker run --name composable-web-db -p 5432:5432 -e POSTGRES_PASSWORD=123 -d postgres

ruby server.rb

curl   -X POST -H "Content-Type: application/json" -d '{"name": "Gabriel"}'  http://localhost:3000/authors --verbose
```

Testing
