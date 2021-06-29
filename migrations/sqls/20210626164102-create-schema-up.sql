/* 
Represents private schema for Calendar app.
This schema is for information that we don't want the user to be accessed by graphql.
For example, user login information.
*/
CREATE SCHEMA app_auth;
/*
It is the schema that allows graphql to query users' information.
This does not mean that every user can pull every information. 
This app has Row Level Security.
*/
CREATE SCHEMA app_calendar;


/*
schema for util functions
*/
CREATE SCHEMA util;

/*
Util functions
*/

CREATE OR REPLACE FUNCTION util.non_empty_trimmed_string(payload text,col_name text) 
    RETURNS BOOLEAN 
AS $$
BEGIN
	    IF (COALESCE(TRIM(payload), '') <> '') THEN
            RETURN TRUE;
        ELSE
            RAISE unique_violation USING MESSAGE = 'Not allowed empty string for ' || col_name;
        END IF;
END;
$$
LANGUAGE plpgsql IMMUTABLE;

COMMENT ON FUNCTION util.non_empty_trimmed_string(text,text) IS 'Checks, whether the given parameter is NULL or ''''';
