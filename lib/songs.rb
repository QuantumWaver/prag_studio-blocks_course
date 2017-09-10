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

class Playlist
  include Enumerable

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

  def each_tagline
    each { |song| yield "#{song.name} - #{song.artist}"}
  end

  def each_by_artist(artist)
    select { |song| song.artist == artist }.each { |s| yield s }
  end

  def each_filename
    each { |s| yield "#{s.name} from #{s.artist}".gsub(" ", "-").downcase }
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

prog.each { |song| song.play }
prog.play_songs

m_songs = prog.select { |song| song.name =~ /M/ }
p m_songs

rush_songs = prog.select { |song| song.artist == "Rush" }
p rush_songs

lable_songs = prog.map { |song| "#{song.artist}: '#{song.name}'" }
p lable_songs

total_duration = prog.reduce(0) { |sum, song| sum + song.duration }
p total_duration

prog.each_tagline { |tag| puts tag }

prog.each_by_artist("Rush") { |song| song.play }

prog.each_filename { |filename| puts filename }
