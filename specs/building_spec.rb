require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../building')
require_relative('../drink')



class TestBuilding < Minitest::Test
  def setup
    @room1 = Room.new("Blue", 10, false)
    @room2 = Room.new("Red", 4, true)
    @room3 = Room.new("Green", 5, true)
    @room4 = Room.new("Yellow", 8, false)

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

    @drink1 = Drink.new("Gin & Tonic", 4.00)
    @drink2 = Drink.new("Beer", 5.00)
    @drink3 = Drink.new("wine", 6.00)

    @drinks = [@drink1, @drink2, @drink3]

  end

  def test_make_a_booking
    @room1.put_it_on_my_tab(@group1, @drinks)
    adding_songs = @room1.add_song_to_room_queue(@playlist1)
    assert_equal(4, adding_songs.count)
    assert_equal(35.00, @room1.bar_tab)
  end

end
