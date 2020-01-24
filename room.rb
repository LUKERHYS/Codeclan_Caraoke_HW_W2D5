class Room
attr_reader :name, :room_size, :guests_in_room

def initialize(name, room_size)
  @name = name
  @room_size = room_size
  @guests_in_room = guests_in_room
  @song_queue = []
end


end
