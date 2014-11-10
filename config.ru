require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# CONTROLLERS
require_relative 'controllers/home_controller'
require_relative 'controllers/authors_controller'
require_relative 'controllers/microposts_controller'
require_relative 'controllers/tags_controller'

require_relative 'models/author.rb'
require_relative 'models/micropost.rb'
require_relative 'models/tag.rb'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
after { ActiveRecord::Base.connection.close }

run Sinatra::Application
