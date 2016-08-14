require('pg')

require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader(:id, :name, :artist_id, :genre)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', #{@artist_id}) RETURNING *"
    album = SqlRunner.run(sql).first
    @id = album['id']
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artist = SqlRunner.run(sql).first
    result = Artist.new(artist)
    return result
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    result = albums.map {|s| Album.new(s)}
    return result
  end

  def stock()
    sql = "SELECT * FROM stocks WHERE album_id = #{@id}"
    stocks = SqlRunner.run(sql)
    result = stocks.map {|a| Stock.new(a)}
    return result
  end

end
