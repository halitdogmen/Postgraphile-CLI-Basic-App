/*
This table briefly represents users registered to the app.
Since graphql can access the entire schema, it may be necessary to change some designs. Private information such as email password is included in the app_private schema.
*/
/*

If you're thinking about something going forward like caching,
it's common practice to have all your data have unique ids. 
In such a case, uuid can be used. 
There is no such idea in this Calendar app.
*/
CREATE TABLE app_calendar.person (
  id SERIAL PRIMARY KEY,
  first_name text CHECK( util.non_empty_trimmed_string(first_name,'first_name')),
  last_name text  CHECK( util.non_empty_trimmed_string(last_name,'last_name')),
  username text,
  created_at timestamptz DEFAULT now()
);
/*
Postgraphile automatically generates documentation by reaching the table commands.
*/

COMMENT ON TABLE app_calendar.person IS 'A user of the calendar app.';
COMMENT ON COLUMN app_calendar.person.id IS 'The Primary unique identifier for person.';
COMMENT ON COLUMN app_calendar.person.first_name IS 'The person^s first name.';
COMMENT ON COLUMN app_calendar.person.last_name IS 'The person^s last name.';
COMMENT ON COLUMN app_calendar.person.created_at IS 'The time this person was created.';


/*
Unique username genarator.
*/



CREATE FUNCTION util.unique_username ()
  RETURNS TRIGGER
  AS $$
declare
  unique_username text;
  i integer;
BEGIN
  unique_username := COALESCE(new.username, LOWER(CONCAT(new.first_name, new.last_name)));
  unique_username := REPLACE(TRANSLATE(unique_username, 'çğıöşü', 'cgiosu'),' ','');
  NEW.username = unique_username;
  i := 1;
  WHILE EXISTS(SELECT * FROM app_calendar.person WHERE username = new.username) LOOP
    unique_username := REPLACE(TRANSLATE(unique_username, 'çğıöşü', 'cgiosu'),' ','');
    i := i + 1;
  END LOOP;
  RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER unique_username
  BEFORE INSERT ON app_calendar.person FOR EACH ROW
  EXECUTE PROCEDURE util.unique_username();