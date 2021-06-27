# Postgraphile-CLI-Basic-App
This project was created with the postgraphile cli. It has JWT authentication and row level security features.

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

Note: You can change the database properties from the database.json file before running the application.
Note: This repository is still under development.