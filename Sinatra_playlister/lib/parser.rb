#this is the parser

class Parser


def make_directory(path)
  my_directory = Dir.new(path).entries.select {|f| !File.directory? f}

  my_directory.each do |song_data|
    artist_name = song_data.split(" - ")[0][0..-1]
    song_title = song_data.split(/ [-\[]/)[1]
    genre = song_data.split(" [")[-1][0..-6]

    temp_song = Song.new
    temp_song.title = song_title

    preexisting_genre = Genre.all.detect {|item| item.name == genre}
  if preexisting_genre
    temp_song.genre=(preexisting_genre)
  else
    temp_genre = Genre.new
    temp_genre.name = genre
    temp_song.genre=(temp_genre)
  end

  preexisting_artist = Artist.all.detect {|item| item.name == artist_name}
  if preexisting_artist
    preexisting_artist.add_song(temp_song)
  else
    temp_artist = Artist.new
    temp_artist.name = artist_name
    temp_artist.add_song(temp_song)
  end

  my_directory
  end

end


end
