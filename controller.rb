require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )

require_relative('models/album')
require_relative('models/artist')

#READ/INDEX
get '/' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:library)
end

#CREATE/NEW
post '/artist/new' do 
  @artist = Artist.new(params)
  @artist.save() 
  redirect(to('/'))
end

#CREATE/NEW
post '/album/new' do
  @album = Album.new(params)
  @album.save
  redirect(to('/'))
end

#READ
get '/instructions' do
  erb(:instructions)
end