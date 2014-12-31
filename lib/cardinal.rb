# Cardinal handles anything and everything system side

require 'json'
require 'io/console'
require_relative 'classlist'
require_relative 'player'
require_relative 'menu'
require_relative 'attack'
require_relative 'gamescreen'
require_relative 'locations'
require_relative 'room'

module Cardinal
  @@player = nil
  
  def clear
    system("reset")
  end

  # Reads keypresses from the user including 2 and 3 escape character sequences.
  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e"
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
    ensure
      STDIN.echo = true
      STDIN.cooked!

    return input
  end

  # save_data should be JSON. pclass is an object from classlist
  def create_player(save_data = nil, pclass = nil, name = nil)
    unless save_data.nil?
      begin
        save_data = JSON.parse(save_data)
      rescue
        raise ArgumentError, "Save Data corrupted or in invalid format"
      end
      @@player = Player.new(save_data)
    else
      @@player = Player.new(nil, pclass, name)
    end
  end

  def display_main
    walls = ["10,10","11,10","12,10","13,10","13,11","13,12","13,13"]
    @room = Room.new(120, 30, 3, 3)
    @room.walls = walls
    @lm = LocationManager.new(@room)
    player = Piece.new("A", 2, 2)
    @lm.add_piece("player", player)
  end

  def play_game
    screen = MainScreen.new
    while true
      screen.lm.load_pieces
      input = screen.room.display
      screen.lm.move_piece("player", input)
    end
  end

  def game_over
    puts "You have met an unfortunate end."
    puts "Press any button to continue."
    read_char
    GameOverMenu.new
  end
end
