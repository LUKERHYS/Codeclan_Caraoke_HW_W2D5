require('minitest/autorun')
require('minitest/reporters')
#require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative( '../room' )
require_relative('../guest')
require_relative('../building')
require_relative('../drink')



class TestRoom < Minitest::Test
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

  def test_can_get_name
    assert_equal("Blue", @room1.name)
  end

  def test_can_get_track_length
    assert_equal(6.00, @song4.track_length)
  end

  def test_can_add_guests_to_room
    adding_guests = @room1.add_guests_to_room(@group1)
    assert_equal(4, adding_guests.count())
  end

  def test_remove_guests_from_room
    @room1.add_guests_to_room(@group1)
    clear_guests = @room1.clear_room_of_guests
    assert_equal(0, clear_guests.count())
  end

  def test_can_add_a_song_to_queue
    adding_songs = @room1.add_song_to_room_queue(@song1)
    assert_equal(1, adding_songs.count())
  end

  def test_can_add_a_playlist_to_queue
    adding_songs = @room1.add_song_to_room_queue(@playlist1)
    assert_equal(4, adding_songs.count)
  end

  def test_remove_songs_from_queue
    @room1.add_song_to_room_queue(@playlist1)
    clear_songs_from_queue = @room1.clear_songs_queue
    assert_equal(0, clear_songs_from_queue.count)
  end

  def test_can_get_total_queue_play_length
    playlist_length = @room2.add_song_to_room_queue(@playlist1)
    length_of_queue = @room2.total_queue_length(playlist_length)
    assert_equal(17.73, length_of_queue)
  end

  def test_can_get_songs_queue
    @room2.add_song_to_room_queue(@song1)
    assert_equal([@song1], @room2.get_songs_queue)
  end

  def test_if_a_room_is_exclusive_use__true
    adding_guests = @room3.add_guests_to_room(@group1)
    assert_equal(true, @room3.is_room_exclusive_use)
  end

  def test_if_a_room_is_exclusive_use__flase
    adding_guests = @room1.add_guests_to_room(@group1)
    assert_equal(false, @room1.is_room_exclusive_use)
  end

  def test_is_there_space_in_room__fail
    @room3.add_guests_to_room(@group1)
    @room3.space_in_room(@group1, @room3)
    assert_equal(4, @room3.get_guests_in_room_number)
  end

  def test_is_there_space_in_room__pass
  @room4.add_guests_to_room(@group1)
  @room4.space_in_room(@group1, @room4)
  assert_equal(8, @room4.get_guests_in_room_number)
  end

  # def test_can_add_guests_to_room_if_space_and_not_exclusive
  #   @room3.add_guests_to_room(@group1)
  #   @room3.add_guests_to_room(@person1)
  #   assert_equal(0, @room3.space_in_room)
  # end

  def test_adding_entry_fee_to_bar_tab
    @room2.add_guests_to_room(@group1)
    @room2.add_entry_to_tab(@group1)
    assert_equal(20.00, @room2.bar_tab)
  end

  def test_adding_drinks_to_bar_tab
    @room2.add_drinks_to_tab(@drinks)
    assert_equal(15.00, @room2.bar_tab)
  end

  def test_add_drinks_and_entry_to_tab
    @room3.put_it_on_my_tab(@group1, @drinks)
    assert_equal(35.00, @room3.bar_tab)
  end

end
