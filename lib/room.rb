#!/usr/bin/ruby
require 'curses'
include Curses


class Room
  attr_reader  :x_size,
               :y_size,
               :walls
  def initialize x_size, y_size, x_pos, y_pos
    @x_size = x_size
    @y_size = y_size
    @walls = nil
    init_screen()
    noecho
    @win = Curses::Window.new( y_size, # height
                               x_size, # width
                               y_pos,  # from_top
                               x_pos)  # from_left
    @win.box("|", "-") 
  end                   
  
  def walls= walls
    @walls = walls
    walls.each do |w| 
      w = w.split "," 
      addch("#", w[0].to_i, w[1].to_i)
    end
  end
  
  def addch(ch, x, y)
    setpos(x, y)
    @win.addch(ch)
  end

  def setpos x, y
    @win.setpos(y, x)
  end
  def display
    @win.getch
  end
  
  def clear
    @win.clear
  end
end

