/*
type for jwt auth.
*/
CREATE TYPE app_calendar.jwt AS (
    role text,
    person_id integer,
    exp bigint
)
