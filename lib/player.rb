class Player
  attr_accessor :hp,
                :inv,
                :equip,
                :lvl,
                :str,
                :mind,
                :dex,
                :vit,
                :class,
                :name,
                :cash,
                :xp,
                :hit,
                :defense,
                :damage

  # If we have saved data then we'll use that, otherwise create new data
  # save_data is assumed to be a Hash, pclass is assumed to be an
  # instance of PlayerClass from classlist.rb
  def initialize(save_data = nil, pclass = nil, name = nil)
    unless save_data.nil?
      raise ArgumentError, "Save Data in unexpected format" unless save_data.instance_of? Hash
      @hp = save_data['hp']
      @inv = save_data['inv']
      @equip = save_data['equip']
      @lvl = save_data['lvl']
      @str = save_data['str']
      @mind = save_data['mind']
      @dex = save_data['dex']
      @vit = save_data['vit']
      @class = save_data['class']
      @name = save_data['name']
      @cash = save_data['cash']
      @xp = save_data['xp']
      @hit = save_data['hit']
      @defense = save_data['defense']
      @damage = save_data['damage']

    # If we don't have any save data, we'll use the starting attributes based on
    # the class the player chose
    else
      raise ArgumentError, "No player class selected" if pclass.nil?
      @hp = pclass.hp
      @inv = pclass.inv
      @equip = pclass.equip
      @lvl = pclass.lvl
      @str = pclass.str
      @mind = pclass.mind
      @dex = pclass.dex
      @vit = pclass.vit
      @class = pclass.class
      @name = name
      @cash = pclass.cash
      @xp = 0
      @hit = 0
      @defense = 0
      @damage = "1d6 + 1"
    end
  end
end
