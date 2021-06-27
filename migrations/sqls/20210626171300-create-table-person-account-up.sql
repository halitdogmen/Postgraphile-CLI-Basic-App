CREATE TYPE app_auth.status_type AS ENUM (
  'verified',
  'not verified'
);

CREATE TABLE app_auth.person_account (
   person_id integer PRIMARY KEY REFERENCES app_calendar.person (id) ON DELETE CASCADE,
   email  text NOT NULL UNIQUE CHECK(email ~* '^.+@.+\..+$'),
   password_hash text NOT NULL,
   status app_auth.status_type
);
