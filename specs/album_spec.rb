require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')

class TestAlbum < MiniTest::Test

def setup
  artist1 = Artist.new( { 'name' => 'Amon Amarth' } )
  @album1 = Album.new( { 'name' => 'Jomsviking', 'artist_id' => artist1.id } )
end

def test_name
  assert_equal("Jomsviking", @album1.name)
end

end