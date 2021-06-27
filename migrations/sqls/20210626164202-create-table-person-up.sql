CREATE TABLE app_calendar.person (
  id SERIAL PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL,
  created_at timestamptz DEFAULT now()
);


COMMENT ON TABLE app_calendar.person IS 'A user of the calendar app.';
COMMENT ON COLUMN app_calendar.person.id IS 'The Primary unique identifier for person.';
COMMENT ON COLUMN app_calendar.person.first_name IS 'The person^s first name.';
COMMENT ON COLUMN app_calendar.person.last_name IS 'The person^s last name.';
COMMENT ON COLUMN app_calendar.person.created_at IS 'The time this person was created.';