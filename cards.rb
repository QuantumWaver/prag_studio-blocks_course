cards = ["Jack", "Queen", "King", "Ace", "Joker"]

cards.each { |c| puts "#{c} - #{c.length}"}

puts "\nShuffle:"
cards.shuffle.each { |c| puts "#{c} - #{c.length}"}

puts "\reverse_each:"
cards.reverse_each { |c| puts "#{c} - #{c.length}"}

puts "\nHASHES:"
scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}
scores.each { |k, v| puts "#{k} = #{v}"}