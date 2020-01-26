class Room
attr_reader :name, :room_size, :exclusive_use
attr_accessor :bar_tab

def initialize(name, room_size, exclusive_use)
  @name = name
  @room_size = room_size
  @guests_in_room = []
  @songs_queue = []
  @exclusive_use = exclusive_use
  @bar_tab = 0.00
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

def get_songs_queue
  return @songs_queue
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

  def is_room_exclusive_use
    return @exclusive_use
  end

  def space_in_room(people, room)
    people_to_add = []
    people_to_add.push(people)
    space_left = @room_size -= @guests_in_room.flatten.count
    if space_left < people_to_add.count
      return room.add_guests_to_room(people_to_add)
    else
      return "Sorry not enough space"
    end
  end

def add_entry_to_tab(people)
  person = people.count
  total = person * 5
  @bar_tab += total
end

def add_drinks_to_tab(drinks)
  for drink in drinks
    @bar_tab += drink.price
  end
end

def put_it_on_my_tab(people, drinks)
  add_drinks_to_tab(drinks)
  add_entry_to_tab(people)
end


end
