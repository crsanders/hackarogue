# Displays the main game loop

require 'curses'
include Curses

module Cardinal
  class MainScreen
    attr_accessor :room,
                  :lm
    def initialize
      init_screen
      curs_set 0
      display_top
      display_main
      display_player_status
      display_system_status
    end

    def display_top
      floor = 1
      # Window.new(Height, Width, Window Y Position, Window X Position)
      win = Window.new(3, 160, 0, 3)
      win.box(?|, ?-)
      win.setpos(1,1)
      win.addstr("Hackarogue")
      win.setpos(1,150)
      win.addstr("Floor: #{floor}")
      win.refresh
    end

    def display_main
      walls = ["10,10","11,10","12,10","13,10","13,11","13,12","13,13"]
      @room = Room.new(120, 30, 3, 3)
      @room.walls = walls
      @lm = LocationManager.new(@room)
      player = Piece.new("A", 2, 2)
      @lm.add_piece("player", player)
      #win = Window.new(30, 120, 3, 3)
      #win.box(?|, ?-)
      #win.refresh
    end

    def display_player_status
      display_player_name
      display_player_stats
    end

    def display_player_name
      win = Window.new(3, 40, 3, 123)
      win.box(?|, ?-)

      # These all need to be strings so that we can use .length for alignment
      player_name = "Evan"
      player_class = "Squire"
      player_level = "1"

      win.setpos(1,1)
      win.addstr("#{player_name}")

      # Sets center-aligned
      win.setpos(1,(20 - (player_class.length/2)))
      win.addstr("#{player_class}")

      # The +8 ensures that it gets right-aligned properly
      win.setpos(1,(40 - (player_level.length + 8)))
      win.addstr("Level: #{player_level}")
      win.refresh
    end

    def display_player_stats
      win = Window.new(27, 40, 6, 123)
      win.box(?|, ?-)
      win.setpos(1,1)
      win.addstr("Health: 15/15")
      win.setpos(2,1)
      win.addstr("Hit: +3")
      win.setpos(3,1)
      win.addstr("Damage: 1d6 + 1")
      win.setpos(5,1)
      win.addstr("Str: 10")
      win.setpos(6,1)
      win.addstr("Mnd: 5")
      win.setpos(7,1)
      win.addstr("Dex: 6")
      win.setpos(8,1)
      win.addstr("Vit: 8")
      win.refresh
    end

    def display_system_status
      win = Window.new(10, 160, 33, 3)
      win.box(?|, ?-)
      win.setpos(1,1)
      win.addstr("-> You enter the dungeon")
      win.refresh
    end
  end
end
