ALTER TABLE app_calendar.event ENABLE ROW LEVEL SECURITY;

CREATE POLICY select_event ON app_calendar.event FOR SELECT TO app_person USING
    (person_id = nullif (current_setting('jwt.claims.person_id', TRUE),
    '')::integer);

CREATE POLICY update_event ON app_calendar.event FOR UPDATE TO app_person USING
    (person_id = nullif (current_setting('jwt.claims.person_id', TRUE),
    '')::integer);

CREATE POLICY delete_event ON app_calendar.event FOR DELETE TO app_person USING
    (person_id = nullif (current_setting('jwt.claims.person_id', TRUE),
    '')::integer);

CREATE POLICY insert_event ON app_calendar.event FOR INSERT TO app_person WITH CHECK
    (person_id = nullif (current_setting('jwt.claims.person_id', TRUE),
    '')::integer);

