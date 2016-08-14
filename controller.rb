require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )

require_relative('models/album')
require_relative('models/artist')
require_relative('models/stock')

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
  redirect(to('/library/'))
end

#CREATE
post '/album/new' do
  @album = Album.new(params)
  @album.save
  redirect(to('/library/'))
end

#CREATE
post '/stock/new' do
  @stock = Stock.new(params)
  @stock.save
  redirect(to('/library/'))
end

#READ
get '/library/edit/' do
  @artists = Artist.all()
  @albums = Album.all()
  @stocks = Stock.all()
  erb(:edit_library)
end