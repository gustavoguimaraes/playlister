### GENRE CLASS

class Genre

attr_accessor :name

@@genre_array = []

  def initialize
     @@genre_array << self
     @name
  end

  def self.reset_genres
    @@genre_array = []
  end

  def songs
    @songs ||= []
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@genre_array
  end
end