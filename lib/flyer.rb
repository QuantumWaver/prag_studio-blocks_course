class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Eddard", "eddard@example.com", 4000, :platinum)
flyers << Flyer.new("Jon", "jon@example.com", 1000)
flyers << Flyer.new("Sansa", "sansa@example.com", 3000, :gold)
flyers << Flyer.new("Arya", "arya@example.com", 2000)

flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles"}

total_miles = flyers.reduce(0) { |sum, f| sum + f.miles_flown }
puts "\tTotal miles flown: #{total_miles}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each { |airline, bonus| puts "Earn #{bonus}x with #{airline}" }

puts "\nFlown at least 3000:"
puts flyers.select { |f| f.miles_flown >= 3000 }

puts "\nFlown less than 3000:"
puts flyers.reject { |f| f.miles_flown >= 3000 }

puts "\nAny platinum?:"
puts flyers.any? { |f| f.status == :platinum }

platinum, other = flyers.partition { |f| f.status == :platinum }
puts "\nPlatinum:"
puts platinum
puts "Other:"
puts other

p flyers.map { |f| "#{f.name} (#{f.status.upcase})"}

total_km_flown = flyers.map { |f| f.miles_flown * 1.6 }.reduce(0, :+)
p total_km_flown

bronze_km = flyers.select { |f| f.status == :bronze }.reduce(0) { |sum, f| sum + (f.miles_flown*1.6) }
p bronze_km

highest_miles = flyers.max_by { |f| f.miles_flown }
puts highest_miles