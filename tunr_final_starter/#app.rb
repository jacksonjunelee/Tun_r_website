require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'better_errors'

#====Models====
require_relative 'models/song.rb'
require_relative 'models/artist.rb'
require_relative 'models/playlist.rb'

#=====Controllers=====
require_relative 'controllers/home_controller.rb'
require_relative 'controllers/songs_controller.rb'
require_relative 'controllers/artists_controller.rb'
require_relative 'controllers/playlists_controller.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'tunr_db',
})

after { ActiveRecord::Base.connection.close }
