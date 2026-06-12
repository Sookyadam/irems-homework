CREATE USER wallet_user WITH PASSWORD 'Strong123!';

CREATE DATABASE wallet_db OWNER wallet_user;

REVOKE ALL ON DATABASE wallet_db FROM PUBLIC;

GRANT CONNECT, TEMPORARY ON DATABASE wallet_db TO wallet_user;

-- after connected to wallet_db

REVOKE ALL ON SCHEMA public FROM PUBLIC;

ALTER SCHEMA public OWNER TO wallet_user;

GRANT USAGE, CREATE ON SCHEMA public TO wallet_user;