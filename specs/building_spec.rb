require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../building')


class TestBuilding < Minitest::Test
  def setup
    @song1 = Song.new("Black Hole Sun", 4.00, "Sound Garden")
    @song2 = Song.new("Baby", 4.33, "Donnie and Joe Emerson")
    @song3 = Song.new("Good Thing Gone", 3.40, "Elle King")
    @song4 = Song.new("Crazy in Love", 6.00, "Beyonce")

    @playlist1 = [@song1, @song2, @song3, @song4]

    @guest1 = Guest.new("Luke", @song1, 50.00)
    @guest2 = Guest.new("Lyndsey", @song4, 50.00)
    @guest3 = Guest.new("Mat", @song2, 50.00)
    @guest4 = Guest.new("Katie", @song3, 50.00)

    @group1 = [@guest1, @guest2, @guest3, @guest4]

  end

end
