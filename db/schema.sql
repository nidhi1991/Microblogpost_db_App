DROP TABLE IF EXISTS microposts_tags CASCADE;
DROP TABLE IF EXISTS microposts CASCADE;
DROP TABLE IF EXISTS tags CASCADE;
DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  photo_url VARCHAR(255),
  username VARCHAR(255),
  date_joined VARCHAR(255),
  age INTEGER,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255)
);

CREATE TABLE microposts (
  id SERIAL PRIMARY KEY,
  date_created VARCHAR(255),
  title VARCHAR,
  author_id INTEGER references authors,
  time_created VARCHAR(255),
  content TEXT
);

CREATE TABLE microposts_tags (
  micropost_id INTEGER REFERENCES microposts,
  tag_id INTEGER REFERENCES tags
);
