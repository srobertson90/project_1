require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')

class TestAlbum < MiniTest::Test

def setup
  @artist1 = Artist.new( { 'name' => 'Amon Amarth' } )
end

def test_name
  assert_equal("Amon Amarth", @artist1.name)
end

end