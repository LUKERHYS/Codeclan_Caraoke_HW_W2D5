require('minitest/autorun')
require('minitest/reporters')
#require('pry')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../building')


class TestGuest < Minitest::Test
  def setup
    @building1 = Building.new("CCC", 100.00)

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
  end

  def test_can_add_money_to_till
    @guest1.play_entry_fee(@building1)
    assert_equal(45.00, @guest1.money)
    assert_equal(105.00, @building1.till)
  end

  def test_guest_can_be_buzzin_mate__fail
    @room4.add_guests_to_room(@guest2)
    @room4.add_song_to_room_queue(@song1)
    result = @guest2.fav_song_in_queue(@room4)
    assert_equal("I am going to the bar!", result)
  end

  def test_guest_can_be_buzzin_mate__pass
    @room4.add_guests_to_room(@guest2)
    @room4.add_song_to_room_queue(@song4)
    result = @guest2.fav_song_in_queue(@room4)
    assert_equal("Whoop", result)
  end


end
