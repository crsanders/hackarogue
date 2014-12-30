# Handles both player attacking and player getting attacked

module Cardinal
  class Attack
    # Both attacker and defender should be members of the Player Class or the
    # Monster Class
    def initialize(attacker = nil, defender = nil)
      raise ArgumentError, "Unexpected attacker" unless attacker.instance_of? Player or Monster
      raise ArgumentError, "Unexpected defender" unless defender.instance_of? Player or Monster
      @attacker = attacker
      @defender = defender
      resolve_attack
      resolve_deaths
    end

    def resolve_attack
      if ((1 + rand(20)) + @attacker.hit) >= @defender.defense
        damage = 1 + rand(@attacker.damage)
        @defender.hp -= damage
        puts "#{@attacker.name} hits, dealing #{damage} points of damage"
      else
        puts "#{@attacker.name} misses"
      end
    end
    
    def resolve_deaths
      if @defender.hp <= 0
        puts "#{@defender.name} died"
        game_over if @defender.instance_of? Player
      end
    end
  end
end
