class Genre
	attr_accessor :name, :songs
	
	def initialize
		@name
		@songs = []
	end

	def artists
		artist = []
		songs.each { | song | artist << song.artist}
		artist.uniq
	end

end