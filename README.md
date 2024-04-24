docker-compose up

API

Retornar todas apólicies

GET - com Authorization: Bearer token
http://localhost:3333/policies

```
curl --request GET \
  --url http://localhost:3333/policies/ \
  --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0ZXN0ZSI6MTIzfQ.4SUGoWdo0lAo3j0jEp_OsklSFkhHm76ZDqkk3Sa_zas'
```

GET - com Authorization: Bearer token
http://localhost:3000/policies/passando-policy_id-1234-2134-1234

```
curl --request GET \
  --url http://localhost:3333/policies/867a5c2e-a689-4120-be94-69b2b493bbe0 \
  --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0ZXN0ZSI6MTIzfQ.4SUGoWdo0lAo3j0jEp_OsklSFkhHm76ZDqkk3Sa_zas'
```
