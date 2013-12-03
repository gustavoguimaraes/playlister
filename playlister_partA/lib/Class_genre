class Genre
  attr_accessor :name, :songs
  # Note: All GENRES 
  All = []

  def initialize
  #   @songs = []
    All << self
  end

  def self.reset_genres
    All.clear
  end

  def self.all
    All
  end

  def songs
    @songs ||= []
    # if @songs.nil?
    # 	@songs = []
    # else 
    # 	@songs 
    # end 
    # @songs
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end

end






