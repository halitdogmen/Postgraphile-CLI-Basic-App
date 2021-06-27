CREATE TABLE app_calendar.settings(
    payload jsonb,
    created_at timestamptz DEFAULT now(),
    person_id int UNIQUE REFERENCES app_calendar.person (id)
);

CREATE INDEX settings_person_idx ON app_calendar.settings (person_id);

COMMENT ON TABLE app_calendar.settings IS 'Represents user preferences';
COMMENT ON COLUMN app_calendar.settings.payload IS 'The person^s first name.';
COMMENT ON COLUMN app_calendar.settings.created_at IS 'The time this object was created.';
COMMENT ON COLUMN app_calendar.settings.person_id IS 'The person^s last name.';
