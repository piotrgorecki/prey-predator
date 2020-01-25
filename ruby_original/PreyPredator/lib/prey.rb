
class Prey < Animal
  @@prey_population_size = 0
  
  def initialize
    @@prey_population_size += 1
    super
  end
  
  def die!
    @@prey_population_size -= 1
    super
  end
  
  def self.population
    @@prey_population_size
  end
  
  def self.clear_population
    @@prey_population_size = 0
  end
end
