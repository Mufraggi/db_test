-- migrate:up
CREATE TABLE comment (
                         id SERIAL PRIMARY KEY,
                         user_id INT REFERENCES "users"(id),
                         post_id INT REFERENCES post(id),
                         content TEXT,
                         created_at TIMESTAMP DEFAULT NOW()
);

-- migrate:down

