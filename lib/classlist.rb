class BaseClass
  attr_reader :hp,
              :inv,
              :equip,
              :lvl,
              :str,
              :mind,
              :dex,
              :vit,
              :class,
              :cash,
              :xp
end

class Squire < BaseClass
  def initialize
    @hp = 10
    @inv = []
    @equip = []
    @lvl = 5
    @str = 8
    @mind = 3
    @dex = 5
    @vit = 10
    @cash = 15
    @class = "Squire"
  end
end

class Mage < BaseClass
  def intialize
    @hp = 6
    @inv = []
    @equip = []
    @lvl = 3
    @str = 3
    @mind = 10
    @dex = 3
    @vit = 5
    @cash = 5
    @class = "Mage"
  end
end

class Archer < BaseClass
  def initialize
    @hp = 8
    @inv = []
    @equip = []
    @lvl = 3
    @str = 5
    @mind = 5
    @dex = 8
    @vit = 7
    @cash = 10
    @class = "Archer"
  end
end
