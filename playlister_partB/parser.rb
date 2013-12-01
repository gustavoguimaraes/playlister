require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'

class Parser

  attr_accessor :directory, :mp3_files, :artists

  def initialize(directory="data")
    @directory = directory
    @mp3_files = collect_songs
    @artists = []
    parse
  end

  def collect_songs
    Dir.entries(directory).select {|f| !File.directory? f}
  end

  def match_song mp3_file
    mp3_to_match = mp3_file.gsub(" [", "*")
    song_regex = /-\s(.*)\*/
    m = song_regex.match(mp3_to_match)
    m[1]   #song title
  end

  def match_artist mp3_file
    mp3_to_match = mp3_file.gsub(" - ", "*")
    artist_regex = /(.*)\*/
    m = artist_regex.match(mp3_to_match)
    m[1]
  end

  def match_genre mp3_file
    genre_regex = /\[(.+)\]/
    m = genre_regex.match(mp3_file)
    m[1]
  end

  def parse
    mp3_files.each do |mp3|
      m_artist = match_artist(mp3)
      m_song = match_song(mp3)
      m_genre = match_genre(mp3)
      
      existing_artist = Artist.search_all(m_artist)

      artist = existing_artist|| Artist.new(m_artist)
      



      song = Song.new(m_song)
      song.genre = Genre.search_all(m_genre) || Genre.new(m_genre)

      artist.add_song(song)

      unless existing_artist
        artists << artist
      end
    end
  end

end


# my_parser = Parser.new
# my_parser.parse
# my_parser.artists.each do |artist|  
#   puts artist.name
#   puts "Genres: #{artist.genres.collect {|genre| genre.name}}"
# end