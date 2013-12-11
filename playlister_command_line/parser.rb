#this is the parser

require 'awesome_print'

class Parser



# artist = /((.*) (?=\-))/
# songs = /(?<=\-).*(?=\[)/
# genre = /(?<=\[).*(?=\])/
# #Used for testing => puts catalog[0].match(genre)
# organizer = []

def parse_songs
files = Dir.entries('data').select { |f| !File.directory? f}
artist = /((.*) (?=\-))/
songs = /(?<=\-).*(?=\[)/
genre = /(?<=\[).*(?=\])/
organizer = []
	files.each do |item|
		song_array = []
		song_array << item.match(artist).to_s.strip
		song_array << item.match(songs).to_s.strip
		song_array<< item.match(genre).to_s.strip
	organizer << song_array
	end
organizer
end

end
#parse_songs(catalog)


