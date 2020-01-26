class Guest
attr_reader :name, :fav_song
attr_accessor :money

def initialize(name, fav_song, money)
  @name = name
  @fav_song = fav_song
  @money = money
end


  def play_entry_fee(building)
    @money -= 5.00
    building.till += 5.00
  end


  def fav_song_in_queue(room)
    songs = room.get_songs_queue
    for song in songs
      if song == @fav_song
        return "Whoop"
      else
        return "I am going to the bar!"
      end
    end
  end


end
