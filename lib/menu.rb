# Contains all of the menus needed by the game

module Cardinal
  class MainMenu
    def initialize
    end

    def display_opening
      clear
      puts "Welcome to Hackarogue!\n\n\n"
      print "Press any button to continue"
      read_char
    end

    def display_options
      options = %w(1 2 3 4)
      clear
      puts "1. Play\n2. Options\n3. Help\n4. Exit"
      c = read_char until options.include? c
      case c
      when "1"
        StartGameMenu.new
      when "2"
        puts "Options"
      when "3"
        puts "Help"
      when "4"
        puts "Exiting"
      end
    end
  end

  class StartGameMenu
    def initialize
      clear
      print "Do you have save data (y/n)? "
      c = read_char until c == 'y' or c == 'n'
      if c == 'y'
        puts "To be completed"
      else
        ClassMenu.new
        play_game
      end
    end
  end

  class ClassMenu
    def initialize
      select_class
      enter_name
      create_player(nil, @class, @name)
    end

    def select_class
      clear
      options = %w(1 2 3)
      puts "Select your class\n"
      puts "1. Squire\n2. Mage\n3. Archer"
      c = read_char until options.include? c
      case c
      when "1"
        @class = Squire.new
      when "2"
        @class = Mage.new
      when "3"
        @class = Archer.new
      end
    end

    def enter_name
      clear
      print "Enter your name: "
      @name = gets.chomp
    end
  end

  class GameOverMenu
    def initialize
      clear
      puts "End Game Stats will go here"
      print "Play again (y/n)? "
      c = read_char until c == 'y' or c == 'n'
      if c == 'y'
        menu = MainMenu.new
        menu.display_options
      else
        exit
      end
    end
  end
end
