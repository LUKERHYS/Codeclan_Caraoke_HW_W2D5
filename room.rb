class Room
attr_reader :name, :room_size

def initialize(name, room_size)
  @name = name
  @room_size = room_size
  @guests_in_room = []
  @songs_queue = []
end

def add_guests_to_room(guests)
  @guests_in_room << guests
  return @guests_in_room.flatten()
end

def clear_room_of_guests
  @guests_in_room = []
  return @guests_in_room
end

def add_song_to_room_queue(song)
  @songs_queue << song
  return @songs_queue.flatten()
end

def clear_songs_queue
  @songs_queue = []
  return @songs_queue
end

  def total_queue_length(room_songs)
    total_playlist_time = 0.00
    for song in room_songs
      total_playlist_time += song.track_length
    end
    return total_playlist_time
  end


end
