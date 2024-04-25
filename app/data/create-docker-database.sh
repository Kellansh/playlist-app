#!/bin/bash

psql --username "playlist-app" --dbname "playlist-app-db" <<EOF
    -- create schema --

    CREATE SCHEMA test_schema;

    -- create users and roles --
    CREATE USER dev_user WITH PASSWORD 'dontHackMe4321' LOGIN;

    CREATE ROLE readwrite;

    GRANT SELECT, INSERT, UPDATE, DELETE
    ON ALL TABLES IN SCHEMA playlist-app_schema
    TO readwrite;

    GRANT readwrite TO dev_user;
    GRANT CONNECT ON DATABASE playlist-app-db to dev_user;

    -- create migration user--
    CREATE USER dev_migrations WITH PASSWORD 'superSecureMigrations4321'  LOGIN;
    CREATE ROLE migration;

    GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
    ON ALL TABLES IN SCHEMA playlist-app_schema
    to migration;

    GRANT migration TO dev_migrations;
    GRANT CREATE, CONNECT ON DATABASE playlist-app-db to dev_migrations;
    GRANT USAGE ON SCHEMA playlist-app_schema to dev_migrations;
    ALTER SCHEMA playlist-app_schema OWNER to dev_migrations;

    -- Set Default Permissions for new tables --
    ALTER DEFAULT PRIVILEGES FOR USER "dev_migrations" IN SCHEMA playlist-app_schema
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO "readwrite";

EOF