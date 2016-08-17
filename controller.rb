require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )

require_relative('models/album')
require_relative('models/artist')
require_relative('models/stock')

#HOME
get '/' do
  redirect(to('/stock/'))
end

#READ
get '/stock/' do
  @artists = Artist.all()
  @albums = Album.all()
  @stocks = Stock.all()
  erb(:stock)
end

#READ
get '/stock/alerts/' do
  @artists = Artist.all()
  @albums = Album.all()
  @stocks = Stock.all()
  erb(:stock_alerts)
end

#READ
get '/library/' do
  @artists = Artist.all()
  @albums = Album.all()
  @stocks = Stock.all()
  erb(:library)
end

#CREATE
post '/artist/new' do 
  @artist = Artist.new(params)
  @artist.save() 
  redirect(to('/library/edit/'))
end

#CREATE
post '/album/new' do
  @album = Album.new(params)

  artist = (((@album.artist).name).downcase.gsub(/\s+/, ""))[0,4]
  album_name = (@album.name).downcase.split.map(&:chr).join
  @album.cover = "#{artist}_#{album_name}" 

  @album.save
  redirect(to('/library/edit/'))
end

#DELETE
post '/album/:id/delete' do
  Album.delete(params[:id])
  redirect(to('/library/edit/'))
end

#CREATE
post '/stock/new' do
  @stock = Stock.new(params)
  @stock.save
  redirect(to('/library/edit/'))
end

#DELETE
post '/stock/:id/delete' do
  Stock.delete(params[:id])
  redirect(to('/library/edit/'))
end

#READ
get '/library/edit/' do
  @artists = Artist.all()
  @albums = Album.all()
  @stocks = Stock.all()
  erb(:edit_library)
end