#!/usr/bin/ruby
require 'curses'
include Curses


class Room
  attr_reader = :x_size,
                :y_size
  def initialize x_size, y_size, x_pos, y_pos
    @x_size = x_size
    @y_size = y_size
    init_screen()
    noecho
    @win = Curses::Window.new( y_size, # height
                               x_size, # width
                               y_pos,  # top
                               x_pos)   # left

    @win.box("|", "-") 
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

