require 'bundler'

# Load defaults
require 'dotenv/load'
require 'sinatra'
Bundler.require(:default, Sinatra::Application.environment)

# Configure Sinatra
require './config/sinatra'

# Configure Active Record
require './config/active_record'

# Load helpers
Dir["./helpers/***.rb"].each{ |file| require file }

# Load components (except for routes)
Dir["./components/**/*.rb"].reject{|f| f.include?('routes.rb')}.each{|f| require f}

# Configure factories for seeding and testing
require './config/factories'
