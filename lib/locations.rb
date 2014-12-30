#!/usr/bin/ruby

class LocationManager 
  def initialize room
    @room = room
    @pieces = {} 
  end

  def add_piece(name, piece_obj)
    @pieces[name] = piece_obj
  end

  def load_pieces
    @pieces.each do |k,v| 
      @room.addch(v.symbol, v.x, v.y)
    end
  end

  def move_piece name, direction
    piece = @pieces[name]
    @room.addch(" ", piece.x, piece.y)
    case direction   
    when 'w'
      piece.y -= 1
    when 's'
      piece.y += 1
    when 'a'
      piece.x -= 1
    when 'd'
      piece.x += 1
    end
  end
end

class Piece
  attr_accessor :symbol,
                :x,
                :y
  def initialize(symbol =nil, x =nil, y =nil)
    @symbol = symbol 
    @x = x
    @y = y
  end 
end
