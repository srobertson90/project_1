DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE albums (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  cover VARCHAR(255),
  artist_id int4 REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE stocks (
  id serial4 PRIMARY KEY,
  album_id int4 REFERENCES albums(id) ON DELETE CASCADE,
  format VARCHAR(255),
  stock_level INT4,
  threshold INT4,
  buy_price INT4,
  sell_price INT4
)