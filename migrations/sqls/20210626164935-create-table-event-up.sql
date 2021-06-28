/*
This table represents the user's events in a specific time period.
*/
CREATE TABLE app_calendar.event (
   id SERIAL PRIMARY KEY,
   title text NOT NULL,
   payload jsonb,
   _start timestamptz NOT NULL,
   _end timestamptz NOT NULL,
   created_at timestamptz DEFAULT now(),
   person_id int REFERENCES app_calendar.person (id)
);
/*
Comments
*/
COMMENT ON TABLE app_calendar.event IS 'Represents user events';
COMMENT ON COLUMN app_calendar.event.title IS 'The event^s title.';
COMMENT ON COLUMN app_calendar.event.payload IS 'The event payload. Text, color etc';
COMMENT ON COLUMN app_calendar.event._start IS 'The event start time';
COMMENT ON COLUMN app_calendar.event._end IS 'The event start time';
/*
We do not want the user to enter events on behalf of someone else.
*/
COMMENT ON COLUMN app_calendar.event.person_id IS '@omit create, update
The person^s id';
