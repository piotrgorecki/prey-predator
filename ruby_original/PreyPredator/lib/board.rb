
require 'set'
require 'matrix'
class Board
  
  MAX_ANIMALS_IN_FIELD = 2
  
  def initialize(row_size, column_size)
    @row_size, @column_size = row_size, column_size
    @board = Matrix.build(row_size, column_size) { [] }
  end
  
  def <<(animal)
    dispose(animal)
  end
  
  def execute_living_conditions 
    @board.collect() do |e|
      next if e.size == 0
      
      if e.size == 1
        # owca -> owca, owca
        if e[0].prey?
          e[1] = Prey.new
          next
        end
        
        # wilk -> pusto
        if e[0].predator?
          e[0].die!; e.delete(e[0])
          next
        end
      end
      
      if e.size == 2
        # owca, owca -> owca, owca
        next if e[0].prey? and e[1].prey?
      
        # wilk, wilk -> pusto
        if e[0].predator? and e[1].predator?
          e[0].die!; e.delete(e[0])
          e[0].die!; e.delete(e[0])
          next
        end
      
        # wilk, owca -> wilk, wilk
        if (e[0].predator? and e[1].prey?) or (e[0].prey? and e[1].predator?)
          if e[0].prey?
            e[0].die!
            e[0] = Predator.new
          else
            e[1].die!
            e[1] = Predator.new
          end
          next
        end
      end
      
    end
  end
  
  def blend(*animal_classes)
    @board = Matrix.build(@row_size, @column_size) { [] }
    
    animal_classes.each do |ac|
      i = ac.population
      ac.clear_population
      i.times {dispose(ac.new)}
    end
  end
  
  def show
    @board.to_a.each do |e| 
      e.each do |r|
        
        a = case r[0].class.to_s
        when 'Prey' then 'O'
        when 'Predator' then 'W'
        else ' '
        end
        
        b = case r[1].class.to_s
        when 'Prey' then 'O'
        when 'Predator' then 'W'
        else ' '
        end
        
        print "[#{a}, #{b}]"
      end
      print "\n"
    end
  end
  
  
  private
  
  def dispose(animal)
    x,y = rand(@row_size), rand(@column_size)
    while @board[x,y].size == MAX_ANIMALS_IN_FIELD
      x,y = rand(@row_size), rand(@column_size)
    end
    @board[x,y] << animal
  end
  
end
