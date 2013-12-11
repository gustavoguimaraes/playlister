class Artist

	attr_accessor :name, :songs

	ARTIST = []

	def initialize
	@name = name
	@songs = []
	ARTIST << self
	end

	def self.count
		@@count
	end

	def self.reset_artists
		@@count = 0
	end

	def self.all
		ARTIST.each do |artist|
			artist
		end
	end

	def songs_count
		songs.length
	end

	def add_song(song)
		songs << song
		song.artist = self
	end

	def genres
		array = []
		songs.each do | song |
			array << song.genre
		end
	 	array.uniq
	end




end



#p Artist.new.add_song("song")










