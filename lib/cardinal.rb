# Cardinal handles anything and everything system side

require 'json'
require_relative 'classlist'
require_relative 'player'
require_relative 'menu'

class Cardinal
  attr_accessor :player

  def initialize
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
      @player = Player.new(pclass, name)
    end
  end
end
