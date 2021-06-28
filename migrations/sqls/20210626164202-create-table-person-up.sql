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
  first_name text NOT NULL,
  last_name text NOT NULL,
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