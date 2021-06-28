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