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

    get '/artists/:index' do
      request = params[:index]
      @requested_artist = @my_artists[request.to_i]
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

    get '/genres/:index' do
      request = params[:index]
      @requested_genre = @my_genres[request.to_i]
      erb :genre_page
    end



  end
end
