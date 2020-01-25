
class Predator < Animal
  @@predator_population_size = 0
  
  def initialize
    @@predator_population_size += 1
    super
  end
  
  def die!
    @@predator_population_size -= 1
    super
  end
  
  def self.population
    @@predator_population_size
  end
  
  def self.clear_population
    @@predator_population_size = 0
  end
  
end
