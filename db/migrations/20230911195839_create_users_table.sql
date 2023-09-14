-- migrate:up
-- db/migrations/YYYYMMDDHHMMSS_create_users_table.sql
CREATE TABLE IF NOT EXISTS users (
    id serial PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- migrate:down

