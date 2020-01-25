
class Animal
  @@population_size = 0
  
  def initialize
    @@population_size += 1
  end
  
  def predator?
    self.kind_of? Predator
  end
  
  def prey?
    self.kind_of? Prey
  end
  
  def die!
    @@population_size -= 1
  end
  
end

class NilClass
  def predator?
    false
  end
  def prey?
    false
  end
end
