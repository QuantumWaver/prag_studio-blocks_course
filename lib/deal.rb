def deal(num_deals=1)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  if block_given? && (num_deals >= 1)
    num_deals.times do
      random_face = faces.sample
      random_suit = suits.sample
      score = yield random_face, random_suit
      puts "You scored a #{score}!"
    end
  else
    puts "No Deal!"
  end
end

deal do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

deal

deal(4) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

puts "\nProgress"

def progress
  0.step(by: 10, to: 100) do |inc|
    yield inc
  end
end

progress { |percent| puts percent }