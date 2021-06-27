
CREATE ROLE app_postgraphile LOGIN PASSWORD 'secret_password';

CREATE ROLE app_anonymous;


GRANT app_anonymous TO app_postgraphile;

CREATE ROLE app_person;

GRANT app_person TO app_postgraphile;

