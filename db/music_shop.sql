DROP TABLE albums;
DROP TABLE artists;
DROP TABLE stocks;

CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255),
  genre varchar(255)
);

CREATE TABLE albums (
  id serial4 primary key,
  name varchar(255),
  artist_id int4 references artists(id) on delete cascade
);

CREATE TABLE stocks (
  id serial4 primary key,
  album_id int4 references albums(id) on delete cascade,
  format varchar(255),
  stock_level integer,
  threshold integer,
  buy_price money,
  sell_price money
)