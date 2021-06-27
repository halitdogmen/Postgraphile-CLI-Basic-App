
CREATE FUNCTION app_calendar.authenticate (email text, password text)
    RETURNS app_calendar.jwt
    AS $$
DECLARE
account app_auth.person_account;
BEGIN
    SELECT
        * INTO account
    FROM
        app_auth.person_account
    WHERE
        person_account.email = authenticate.email;

    IF account.password_hash = crypt(password, account.password_hash) THEN
        RETURN ('app_person',
        account.person_id,
        extract(epoch FROM (now() + interval '30 days')))::app_calendar.jwt;
    ELSE
        RETURN NULL;
    END IF;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;
