#!/usr/bin/ruby
require './locations'
require './room'

room = Room.new(50, 50, 3, 3)
lm = LocationManager.new(room)
evan = Piece.new("E", 25, 25)
lm.add_piece("evan", evan)

loop do
  lm.load_pieces      
  input = room.display
  lm.move_piece("evan", input)
end
