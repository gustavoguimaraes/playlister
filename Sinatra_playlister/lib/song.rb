class Song

attr_accessor :genre, :artist, :title

  def initialize
      @title
      @artist
      @genre
  end

  def genre=(song_genre)
    @genre = song_genre
    song_genre.songs << self
  end

end