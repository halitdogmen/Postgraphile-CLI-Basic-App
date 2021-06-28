/*
Postgraphile user. To get the necessary information
*/
CREATE ROLE app_postgraphile LOGIN PASSWORD 'secret_password';
/*
User role that are not logged in
    Permissions
        - Register
        -Login
*/
CREATE ROLE app_anonymous;


GRANT app_anonymous TO app_postgraphile;
/*
Logged user
    Permissions
        -Own Events
        -Own Info
*/
CREATE ROLE app_person;

GRANT app_person TO app_postgraphile;

