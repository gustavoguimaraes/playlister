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
      @requested_artist
    end

    get '/' do
      erb :directory
    end

    get '/artist_directory' do
      @my_artists
      erb :artist_directory
    end

    get '/artists/:name' do
      request = params[:name]
      @my_artists.each do |artist|
        if artist.slugged_name.downcase == request.downcase
          @requested_artist = artist
        end
      end
      erb :artist_page
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

    get '/genres/:name' do
      request = params[:name]
      @my_genres.each do |genre|
        if genre.name.downcase == request.downcase
        @requested_genre = genre
        end
      end
      erb :genre_page
    end



  end
end
