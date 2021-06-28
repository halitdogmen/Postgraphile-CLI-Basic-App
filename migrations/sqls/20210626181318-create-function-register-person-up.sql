/*
We want to connect the user's registration to a certain business logic.
*/
CREATE FUNCTION app_calendar.register_person(first_name text, last_name text, email text, password text)
    RETURNS app_calendar.person
    AS $$
DECLARE
    person app_calendar.person;
BEGIN
    INSERT INTO app_calendar.person (first_name, last_name)
        VALUES(first_name,last_name)
    RETURNING
        * INTO person;
    INSERT INTO app_auth.person_account (person_id,email,password_hash, status)
        VALUES (person.id, email, crypt(password, gen_salt('bf')),'not verified');
    RETURN person;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;