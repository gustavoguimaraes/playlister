class Genre
	attr_accessor :name, :songs
	
	@@genres =[]
	def initialize name
		@name
		@songs = []
		@@genres << self
	end

	def artists
		artist = []
		songs.each { | song | artist << song.artist}
		artist.uniq
	end

	def self.reset_genres
		@@genres.clear
	end

	def	self.all
		@@genres
	end

	def self.search_all(genre)
    	@@genres.detect { |defined_genre| defined_genre.name == genre }
  	end

end