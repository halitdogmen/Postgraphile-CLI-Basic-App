/*
This function extracts the user's id from jwt. so that the user can take action without sending his id.
*/
CREATE FUNCTION app_calendar.set_person_id ()
    RETURNS TRIGGER
    AS $$
BEGIN
    NEW.person_id =current_setting('jwt.claims.person_id');
    RETURN NEW;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER event_person_id
    BEFORE INSERT ON app_calendar.event FOR EACH ROW
    EXECUTE PROCEDURE app_calendar.set_person_id();