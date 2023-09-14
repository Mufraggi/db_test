-- migrate:up

CREATE TABLE IF NOT EXISTS post (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    user_id INT REFERENCES users(id) -- Assuming there's a "user" table with an "id" column
);

-- migrate:down

