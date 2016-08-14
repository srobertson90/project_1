require('minitest/autorun')
require('minitest/rg')
require_relative('../models/album')

class TestAlbum < MiniTest::Test

def setup
  @album1 = Album.new( { 'name' => 'Jomsviking' } )
end

def test_name
  assert_equal("Jomsviking", @album1.name)
end

end