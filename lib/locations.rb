#!/usr/bin/ruby

module Cardinal
  class LocationManager 
    def initialize room
      @maxtop = 0
      @maxbottom = room.y_size - 1
      @maxleft = 0
      @maxright = room.x_size - 1
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
    
    def wallcheck xy
      @room.walls.include? xy
    end
    def move_piece name, direction
      piece = @pieces[name]
      @room.addch(" ", piece.x, piece.y)
  
      case direction   
  
      when 'w'
        req = (piece.y - 1)
        req_xy = "#{piece.x},#{req}"
        unless wallcheck req_xy or req <= @maxtop 
          piece.y = req  
        end
  
      when 's'
        req = (piece.y + 1)
        req_xy = "#{piece.x},#{req}"
        unless wallcheck req_xy or req >= @maxbottom
          piece.y = req 
        end
  
      when 'a'
        req = (piece.x - 1)
        req_xy = "#{req},#{piece.y}"
        unless wallcheck req_xy or req <= @maxleft
          piece.x = req 
        end
   
      when 'd'
        req = (piece.x + 1)
        req_xy = "#{req},#{piece.y}"
        unless wallcheck req_xy or req >= @maxright
          piece.x = req 
        end
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
end
