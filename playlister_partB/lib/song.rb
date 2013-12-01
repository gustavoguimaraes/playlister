class Song

attr_accessor :genre, :artist, :title 


	def initialize title
	 	@title = title
	# 	@artist = []
	# 	@genre
	 end

	
	def genre=(genre)
		@genre = genre
		genre.songs << self
	end



end

#p Song.new.genre = "rap"

# puts a

#genre=("rap")