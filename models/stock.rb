require('pg')

require_relative('../db/sql_runner')
require_relative('album')

class Stock

  attr_reader(:id, :album_id, :format, :stock_level, :threshold, :buy_price, :sell_price)

  def initialize(options)
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
    @format = options['format']
    @stock_level = options['stock_level'].to_i
    @threshold = options['threshold'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['buy_price'].to_i
  end

  def save()
    sql = "INSERT INTO stocks (album_id, format, stock_level, threshold, buy_price, sell_price) VALUES ( #{@album_id}, '#{@format}', #{@stock_level}, #{@threshold}, #{@buy_price}, #{@sell_price}) RETURNING *"
    stock = SqlRunner(sql).first
    @id = stock['id']
  end

  def album()
    sql = "SELECT * FROM albums where id = #{@album_id}"
    album = SqlRunner.run(sql).first
    result = Album.new(album)
    return result
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    stocks = SqlRunner.run(sql)
    result = stocks.map { |s| Stock.new(s) }
    return result
  end

end