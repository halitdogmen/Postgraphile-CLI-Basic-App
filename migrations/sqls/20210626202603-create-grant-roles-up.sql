
ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT USAGE ON SCHEMA app_calendar TO app_anonymous, app_person;

GRANT EXECUTE ON FUNCTION app_calendar.register_person(text, text, text, text) TO app_anonymous;
GRANT EXECUTE ON FUNCTION app_calendar.authenticate(text, text) TO app_anonymous, app_person;

GRANT ALL privileges ON TABLE app_calendar.person TO app_person;
GRANT SELECT, DELETE ON TABLE app_calendar.event TO app_person;

GRANT INSERT, UPDATE (id, title, payload, _start, _end ) ON TABLE app_calendar.event TO app_person;
GRANT USAGE ON SEQUENCE app_calendar.event_id_seq TO app_person;
