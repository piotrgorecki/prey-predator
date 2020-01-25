
require './board'
require './animal'
require './prey'
require './predator'

print "plansza x: "
row_size = 7
print "plansza y: "
column_size = 8

print "drapieznikow: "
predator_n = 30
print "ofiar: "
prey_n = 60

print "iteracji: \n"
i = 100


board = Board.new(row_size, column_size)
prey_n.times { board << Prey.new }
predator_n.times {board << Predator.new }

f = File.new "data.csv", "w+"
f.write "iteration\tPrey\tPredator\n"

i.times do |j|
  f.write "#{j+1}\t#{Prey.population}\t#{Predator.population}\n"
#  board.show
  board.execute_living_conditions
  board.blend Prey, Predator
end
f.close

`R --no-save < ./r_plots.r`