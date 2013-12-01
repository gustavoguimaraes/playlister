require './parser'

#Shamelessly copied this from Oliver's app.rb in order to get an idea. It only lists the artists' name. Did not have the time to finish my app. 

class App

  attr_accessor :my_parser

  def initialize
    @my_parser = Parser.new('./data')
  end

  def greeting
    puts "+" * 50
    puts "Welcome to Playlister, a CLI application to convert a directory into a playlist!"
    puts "+" * 50
  end



  def AorG_prompt
    puts "Browse by Artist or Genre (type 'artist' or 'genre')"
    inp = gets.chomp
    while inp != "artist" || "genre"
      puts "Please type either 'artist' or 'genre'"
      inp = gets.chomp
     end
    return inp
  end

  def ListArtists
    artists = my_parser.artists.collect {|artist| artist.name}.sort
    return artists.each_with_index {|artist, i| puts "#{i+1}: #{artist}"}
  end

  def ListGenres
  end

  def ListSongs artist
  end


end

 app = App.new
 app.ListArtists