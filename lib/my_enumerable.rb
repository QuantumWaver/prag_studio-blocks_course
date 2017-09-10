class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end


module MyEnumerable
  def my_map
    new_array = []
    each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_select
    new_array = []
    each do |value|
      new_array << value if yield(value)
    end
    new_array
  end

  def my_reject
    new_array =[]
    each do |item|
      new_array << item unless yield(item)
    end
    new_array
  end

  def my_detect
    each do |item|
      return item if yield(item)
    end
    nil
  end

  def my_any?
    each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    each do |item|
      return false if yield(item)
    end
    true
  end

  def my_reduce(init_value)
    sum = init_value
    each do |item|
      sum = yield sum, item
    end
    sum
  end
end


class Playlist
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def play_songs
    puts "\nBegin playing:"
    each { |song| song.play }
  end

end

s1 = Song.new("Prime Mover", "Rush", 5)
s2 = Song.new("Metropolis", "Dream Theater", 8)
s3 = Song.new("Available Light", "Rush", 4)
s4 = Song.new("I don't believe in Love", "Queensryche", 5)

prog = Playlist.new("Prog Metal")
prog.add_song(s1)
prog.add_song(s2)
prog.add_song(s3)
prog.add_song(s4)

puts "\nmy_select:"
rush_songs = prog.my_select { |song| song.artist == "Rush" }
p rush_songs

puts "\nmy_map:"
lable_songs = prog.my_map { |song| "#{song.artist}: '#{song.name}'" }
p lable_songs

puts "\nmy_reject:"
non_rush_songs = prog.my_reject { |song| song.artist == "Rush" }
p non_rush_songs

puts "\nmy_detect:"
p prog.my_detect { |song| song.duration == 4 }

puts "\nmy_any?:"
p prog.my_any? { |song| song.duration == 21 }
p prog.my_any? { |song| song.duration == 8 }

puts "\nmy_none?:"
p prog.my_none? { |song| song.duration == 21 }
p prog.my_none? { |song| song.duration == 8 }

puts "\nmy_reduce:"
total_duration = prog.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration

