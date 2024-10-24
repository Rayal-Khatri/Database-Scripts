CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);


INSERT INTO users (id, username, email) VALUES (1, 'john_doe', 'john@example.com');
INSERT INTO users (id, username, email) VALUES (2, 'jane_smith', 'jane@example.com');
INSERT INTO users (id, username, email) VALUES (3, 'sam_brown', 'sam@example.com');
