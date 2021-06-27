REASSIGN OWNED BY app_postgraphile TO postgres;  -- or some other trusted role
DROP OWNED BY app_postgraphile;
-- repeat both in ALL databases where the role owns anything or has any privileges!

DROP USER app_postgraphile;


REASSIGN OWNED BY app_anonymous TO postgres;  -- or some other trusted role
DROP OWNED BY app_anonymous;
-- repeat both in ALL databases where the role owns anything or has any privileges!

DROP USER app_anonymous;

REASSIGN OWNED BY app_person TO postgres;  -- or some other trusted role
DROP OWNED BY app_person;
-- repeat both in ALL databases where the role owns anything or has any privileges!

DROP USER app_person;


