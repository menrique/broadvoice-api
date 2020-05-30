require 'bundler'

# Load defaults
require 'dotenv/load'
require 'sinatra'
Bundler.require(:default, Sinatra::Application.environment)

# Configure Sinatra
require './config/sinatra'

# Configure Active Record
require './config/active_record'

# Load components (except for the routes)
Dir["./components/**/*.rb"].reject{|f| f.include?('routes.rb')}.sort.each{|f| require f}
