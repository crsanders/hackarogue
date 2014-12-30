# Cardinal handles anything and everything system side

require 'json'
require 'io/console'
require_relative 'classlist'
require_relative 'player'
require_relative 'menu'
require_relative 'attack'

module Cardinal

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
      @player = Player.new(save_data)
    else
      @player = Player.new(nil, pclass, name)
    end
  end

  def game_over
    puts "You have met an unfortunate end."
    puts "Press any button to continue."
    read_char
    GameOverMenu.new
  end
end
