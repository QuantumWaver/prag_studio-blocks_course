scores = [83, 71, 92, 64, 98, 87, 75, 69]

puts "\nSelect:"
high = scores.select { |s| s > 80 }
puts high

puts "\nReject:"
low = scores.reject { |s| s > 80 }
puts low

puts "\nAny less than 70:"
puts scores.any? { |s| s < 70 }

puts "\nDetect first failing score:"
puts scores.detect { |s| s < 70 }

puts "\nAny less than 50:"
puts scores.any? { |s| s < 50 }

puts "\nPartition:"
p scores.partition { |s| s > 70 }
pass, failed = scores.partition { |s| s > 70 }
p pass, failed

puts "\nReduce:"
p scores.reduce(0, :+)

puts "\nMap"
p scores.map { |s| s * 2}

puts "\nSelect'!'"
p scores
scores.select! { |s| s > 70 }
p scores

puts "\nReject'!'"
p scores
scores.reject! { |s| s.even? }
p scores