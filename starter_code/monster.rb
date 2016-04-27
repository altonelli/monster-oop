# Monster class
$threat = {
  :low => 0,
  :medium => 1,
  :high => 2,
  :midnight => 3
}

module Flying
  def fly
    puts(self.name + " soars across the sky")
  end
end

class Monster
  attr_accessor :habitat, :threat_level
  @@count = 0
  def initialize(threat_level = :medium)
    @threat_level = threat_level
    @@count += 1
    p "RAWR!"
    p "#{@@count} monsters created"
  end

  def is_habitat(str)
    str === @habitat ? true : false
  end

  def self.count
    @@count
  end

  def fight(monster)
    $threat[monster.threat_level] >= $threat[@threat_level] ? monster : self
  end

  def get_dangerous
  case @threat_level
    when :low
      @threat_level = :medium
    when :medium
      @threat_level = :high
    when :high
      @threat_level = :midnight
    when :midnight
      :midnight
  end
  end

end

class Zombie < Monster
  attr_accessor :name, :description
  def initialize(threat_level = :medium,habitat = "graveyard", description = "Mushy")
    super(threat_level)
    @habitat = habitat
    @description = description

  end
end

class Werewolf < Monster
  attr_accessor :name, :description
  def initialize(threat_level = :low,description = "Hairy")
    super(threat_level)
    @description = description
  end

  def update_threat_level(full_moon)
    full_moon ? @threat_level = :midnight : @threat_level = :low
  end
end

class Vampire < Monster
  include Flying
  attr_accessor :name, :description
  def initialize(threat_level = :medium)
    super(threat_level)
    @name = "The Vampire"
  end
end

boo = Monster.new(:high)
boo.habitat = "room"
p boo.threat_level
p boo.habitat

yeti = Monster.new
yeti.habitat = "tundra"
p yeti.is_habitat("swamp")
p yeti.is_habitat("tundra")
predator = Monster.new(:high)
alien = Monster.new(:high)
p Monster.count

p alien.fight(predator)
p predator

rob = Zombie.new
puts rob.habitat
# "graveyard"
puts rob.threat_level
# :medium
rob.name = "Rob Zombie"
puts rob.name
# "Rob Zombie"

teen_wolf = Werewolf.new
puts teen_wolf.threat_level
# :low

vamp = Vampire.new
vamp.fly

dracula = Vampire.new(:high)
dracula.name = "Count Dracula"
dracula.fly

  # getters and setters for instance variables

  # class variable for count

  # class instance variable for class description

  # class method getter for @@count class variable

  # class method getter for @class_description class instance variable

  # initial behavior

  # habitat? instance method

  # get_dangerous instance method

  # fight class method

# Zombie class

  # zombie version of class_description

  # initial behavior and values

# Werewolf class

  # werewolf version of class_description

  # initial behavior and values

  # update_threat_level instance method

# Flying module

  #fly method

# Vampire class

  # vampire class description

  # Flying module included
