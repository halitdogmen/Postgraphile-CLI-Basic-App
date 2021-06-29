# Postgraphile-CLI-Basic-App
This project was created with the postgraphile cli. It has JWT authentication and row level security features.

Note: This repository is still under development. Therefore, documents such as database design, sample queries will be uploaded later.
In addition to all these, e2e tests will be included in the project.

## Motivation
It can provide fast results in rapid API development in some applications such as startup demo or competition that need to be developed quickly with Postgraphile. Being fully compatible with Postgresql increases this speed.

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

Note: You can change the database properties from the database.json file before running the application.

