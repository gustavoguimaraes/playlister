class Song

attr_accessor :genre, :artist, :title, :slugged_name

  def initialize
      @title
      @artist
      @genre
      @slugged_name
  end

  def slugged_name
     @slugged_name = @title.gsub(" ", "_")
  end 


  def genre=(song_genre)
    @genre = song_genre
    song_genre.songs << self
  end

end