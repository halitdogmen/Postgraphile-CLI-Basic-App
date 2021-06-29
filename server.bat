npx postgraphile -c postgres://postgres:user@localhost:5432/calendar-app --schema app_calendar  --append-plugins @graphile-contrib/pg-simplify-inflector --enhance-graphiql --allow-explain --watch --owner-connection postgres://postgres:user@localhost:5432/calendar-app --default-role app_anonymous --jwt-token-identifier app_calendar.jwt --jwt-secret secret_for_jwts --extended-errors hint,detail,errcode