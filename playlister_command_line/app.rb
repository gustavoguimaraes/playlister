#this is the app
require './parser'

def browsing
	puts "Browse by artist or genre"
	browse_choice = gets.chomp.downcase
	parser = Parser.new

	catalog = parser.parse_songs

	if browse_choice == "artist"
		artist_catalog = []
		artist_songs = {}
		catalog.each do |file|
			artist_catalog << file[0]
			 
				 if artist_songs[file[0]].nil?
				  artist_songs[file[0]] = 1 
				 else
				 	artist_songs[file[0]] += 1
				 end

		end
		
		artist_catalog.uniq!.sort
		
		artist_songs.each do |artist, count|
			if count == 1
				puts "#{artist} - #{count} song"
			else
				puts "#{artist} - #{count} songs"
			end
		end

		#puts artist_catalog
		
		puts "There are #{artist_catalog.count} artists in this list"


###################################
		puts "Select an artist"
		which_artist = gets.chomp
		artist_genre = {}

		temp = []
		catalog.collect do |file|
			
			if file[0] == which_artist
				temp <<file[0]

				artist_genre[file[1]] = file[2]
			end
			
		end
#define a method to print Artist - 2 songs#######
		if temp.size == 1
			puts which_artist + " - #{temp.size} song"
		else
			puts which_artist + " - #{temp.size} songs"
		end
##########################################
		num = 1
		artist_genre.each do |song, genre|
				puts "#{num}. #{song} - #{genre}"
				num = num + 1
		end


	elsif browse_choice == "genre"
		genre_catalog = []
		catalog.each do |file|
			genre_catalog << file[2]
		end
		
		genre_catalog.uniq!.sort
		
		puts genre_catalog
	 	
	 	puts "There are #{genre_catalog.count} genres in this list"

	 	puts "Select a genre"
	 	which_genre = gets.chomp
	 	genre_artist = []
	 	genre_songs =[]
	 	
	 	catalog.each do |file|
	 		if file[2] == which_genre
	 			genre_artist<< file[0]
	 			genre_songs << file[1]
	 		end
	 	end
	 		 
	 		 puts which_genre+ ": " +"#{genre_songs.size} Songs, #{genre_artist.size} Artist. Type \"artist\"  or \"songs\" to see all artists or songs from this genre"
	 		 response = gets.chomp

	 		 if response == "artist"
	 		 	puts genre_artist
	 		 elsif response == "songs"
	 		 	puts genre_songs
	 		 else
	 		 	puts "make sure you type artist or songs"
	 		 end

	else
		puts "sorry, I don't understand your input"
	end


end


browsing