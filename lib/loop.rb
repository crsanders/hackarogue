#!/usr/bin/ruby
require './locations'
require './room'

walls = ["10,10","11,10","12,10","13,10","13,11","13,12","13,13"]
room = Room.new(50, 50, 20, 3)
room.walls= walls
lm = LocationManager.new(room)
player = Piece.new("A", 2, 2)
lm.add_piece("player", player)
curs_set 0
loop do
  lm.load_pieces      
  input = room.display
  
  lm.move_piece("player", input)
end
