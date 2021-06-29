# Postgraphile-CLI-Basic-App
This project was created with the postgraphile cli. It has JWT authentication and row level security features.

Note: This repository is still under development. Therefore, documents such as database design, sample queries will be uploaded later.
In addition to all these, e2e tests will be included in the project.

## Todo
- [x] Creation of person table in app.calendar schema.
- [x] Creation of event table in app.calendar schema.
- [x] Creation of person_account table in app_private schema.
- [x] User registration.
- [x] JWT authentication.
- [x] User login.
- [x] Creating event by user.
- [x] Row Level Security.
- [x] Table comments.
- [ ] Tests.
- [x] Check user properties (non empty trimmed string PostgreSQL Function).
- [x] Clearly understandable error outputs (PostgreSQL Function).
- [ ] Database diagrams.

## Motivation
In some situations, such as a startup demo or competition that need to be developed quickly, Postgraphile can be a good alternative for API development. Being fully compatible with Postgresql increases this speed.

## Installation
First of all, nodejs modules must be loaded.
```bash
$ npm install
```
After editing the database.json file
```bash
$ npx db-migrate up
```

If you want to reset the created database
```bash
$ npx db-migrate reset
```

## Usage
Second, the app must be launched.

```bash
$ .\server.bat
```

## Test

Firstly, run server 
```bash
$ .\server.bat
```
and then, open new terminal

```bash
$ npm run test
```

Note: You should change the database properties from the database.json and server.bat file before running the application.
## Database Diagrams
## app_auth Schema
![alt text](https://github.com/halitdogmen/Postgraphile-CLI-Basic-App/blob/main/Diagrams/app_auth.png?raw=true)


