# Contains all of the menus needed by the game

class MainMenu
  def initialize
  end

  def clear
    system("reset")
  end

  def display_opening
    clear
    puts "Welcome to <title>"
  end
end
