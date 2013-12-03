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




#Hint: use the method below to implement the classes Song, Genre and Artist with the Parser.
  # def parse
  #   mp3_files.each do |mp3|
  #     m_artist = match_artist(mp3)
  #     m_song = match_song(mp3)
  #     m_genre = match_genre(mp3)
      
  #     existing_artist = Artist.search_all(m_artist)

  #     artist = existing_artist|| Artist.new(m_artist)
      



#       song = Song.new(m_song)
#       song.genre = Genre.search_all(m_genre) || Genre.new(m_genre)

#       artist.add_song(song)

#       unless existing_artist
#         artists << artist
#       end
#     end
#   end

# end


# my_parser = Parser.new
# my_parser.parse
# my_parser.artists.each do |artist|  
#   puts artist.name
#   puts "Genres: #{artist.genres.collect {|genre| genre.name}}"
# end