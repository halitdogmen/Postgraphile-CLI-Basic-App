/*
This table represents user preferences. The jsonb structure is used to create a general dynamic structure.
*/
CREATE TABLE app_calendar.settings(
    person_id int UNIQUE REFERENCES app_calendar.person (id),
    payload jsonb,
    created_at timestamptz DEFAULT now()
);
/*
Added index for better performance. It is certain that the query will be made according to the user id.
*/
CREATE INDEX settings_person_idx ON app_calendar.settings (person_id);
/*
Comments 
*/
COMMENT ON TABLE app_calendar.settings IS 'Represents user preferences';
COMMENT ON COLUMN app_calendar.settings.payload IS 'The person^s first name.';
COMMENT ON COLUMN app_calendar.settings.created_at IS 'The time this object was created.';
COMMENT ON COLUMN app_calendar.settings.person_id IS 'The person^s last name.';
