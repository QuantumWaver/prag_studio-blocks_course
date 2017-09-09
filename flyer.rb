class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

flyers = []
1.upto(5) do |i|
  flyers << Flyer.new("Flyer #{i}", "Flyer#{i}@email.com", rand(1000..100000))
end

flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles"}

total_miles = flyers.reduce(0) { |sum, f| sum += f.miles_flown }
puts "\tTotal miles flown: #{total_miles}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each { |airline, bonus| puts "Earn #{bonus}x with #{airline}" }

# dir = Dir.new("/Users/HigherSymmetry")
# dir.each { |entry| puts entry }