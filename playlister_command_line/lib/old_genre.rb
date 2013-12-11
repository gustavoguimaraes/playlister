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













# 	attr_accessor :name, :songs
	
# 	@@genres =[]
# 	def initialize
# 		@name
# 		@songs = []
# 		@@genres << self
# 	end

# 	def artists
# 		artist = []
# 		songs.each { | song | artist << song.artist}
# 		artist.uniq
# 	end

# 	def self.reset_genres
# 		@@genres.clear
# 	end

# 	def	self.all
# 		@@genres
# 	end
# end