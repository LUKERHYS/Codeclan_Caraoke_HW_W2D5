require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative( '../room' )
require_relative('../guest')


class TestRoom < Minitest::Test
  def setup
    @room1 = Room.new("Blue", 10)
    @room2 = Room.new("Red", 4)
    @room3 = Room.new("Green", 5)
    @room4 = Room.new("Yellow", 8)

    @song1 = Song.new("Black Hole Sun", 4.00, "Sound Garden")
    @song2 = Song.new("Baby", 4.33, "Donnie and Joe Emerson")
    @song3 = Song.new("Good Thing Gone", 3.40, "Elle King")
    @song4 = Song.new("Crazy in Love", 6.00, "Beyonce")

    @playlist1 = [@song1, @song2, @song3, @song4]

    @guest1 = Guest.new("Luke", @song1)
    @guest2 = Guest.new("Lyndsey", @song4)
    @guest3 = Guest.new("Mat", @song2)
    @guest4 = Guest.new("Katie", @song3)

    @group1 = [@guest1, @guest2, @guest3, @guest4]
  end

  def test_can_get_name
    assert_equal("Blue", @room1.name)
  end

  def test_can_add_guests_to_room
    adding_guests = @room1.add_guests_to_room(@group1)
    assert_equal(4, adding_guests)
  end

  def test_reomove_guests_from_room
    @room1.add_guests_to_room(@group1)
    assert_equal(0, @room1.clear_room_of_guests)
  end

  def test_can_add_a_song_to_queue
    adding_songs = @room1.add_song_to_room_queue(@song1)
    assert_equal(1, adding_songs)
  end

  def test_can_add_a_playlist_to_queue
    adding_songs = @room1.add_song_to_room_queue(@playlist1)
    assert_equal(4, adding_songs)
  end

  def test_remove_songs_from_queue
    @room1.add_song_to_room_queue(@playlist1)
    assert_equal(0, @room1.clear_songs_queue)
  end



end
