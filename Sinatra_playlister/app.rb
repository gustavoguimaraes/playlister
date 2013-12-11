require 'bundler'
Bundler.require

require './lib/parser.rb'
require './lib/artist.rb'
require './lib/song.rb'
require './lib/genre.rb'

module Playlister
  class App < Sinatra::Application
    
    before do
      @my_directory = Parser.new.make_directory("data")
      @my_artists = Artist.all 
      @my_genres = Genre.all
    end

    get '/' do
      erb :directory
    end

    get '/artist_directory' do
      @my_artists
      erb :artist_directory
    end

    get '/directory/:name' do
      request = params[:name]
      
      if (@my_artists.each do |artist|
        if artist.slugged_name.downcase == request.downcase
          @requested_artist = artist
          true
        else
          false
        end
        end)
          erb :artist_page
      # elsif (@my_genres.each do |genre|
      #     if genre.name.downcase == request.downcase
      #       @requested_genre = genre
      #       true
      #     else
      #       false
      #     end
      #   end)
      #   erb :genre_page
      else
      erb :directory
    end
    end

    get '/songs/:artist/:index' do
      creator = params[:artist]
      location = params[:index]
      @song = @my_artists.songs[location.to_i]
      erb :artist_page
    end

    get '/genre_directory' do
      @my_genres
      erb :genre_directory
    end

    get '/genres/:index' do
      request = params[:index]
      @requested_genre = @my_genres[request.to_i]
      erb :genre_page
    end



  end
end
