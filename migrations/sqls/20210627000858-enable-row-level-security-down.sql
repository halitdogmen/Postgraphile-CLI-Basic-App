ALTER TABLE app_calendar.event DISABLE ROW LEVEL SECURITY;

DROP POLICY select_event ON app_calendar.event;
DROP POLICY update_event ON app_calendar.event;
DROP POLICY delete_event ON app_calendar.event;
DROP POLICY insert_event ON app_calendar.event;