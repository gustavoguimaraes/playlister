class Artist

attr_accessor :name, :songs

@@artist_array = []


    def initialize
       @name
       @songs = []
       @@artist_array << self
    end

    def self.count
        @@artist_array.length
    end

    def self.all
        @@artist_array
    end  
      
    def self.reset_artists
        @@artist_array = [] 
    end

    def add_song(given_song)
      songs << given_song
      given_song.artist = self
    end

    def songs_count
      songs.length
      
    end

    def genres
      songs.collect{|song| song.genre}.uniq
      
    end

end










