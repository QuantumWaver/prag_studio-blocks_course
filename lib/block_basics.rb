puts "Let's start mastering Ruby blocks!"

puts "\ntimes"
3.times { |i| puts "Rush #{i}" }

puts "\nupto:"
1.upto(3) { |i| puts "Rush #{i}" }

var = 2112
puts "\nstep"
1.step(by: 2, to: 9) { |i| puts "Rush #{i} #{var}" }

