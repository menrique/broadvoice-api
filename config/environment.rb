require 'bundler'

# Load defaults
require 'dotenv/load'
require 'sinatra'
Bundler.require(:default, Sinatra::Application.environment)

# Configure Sinatra
require './config/sinatra'

# Configure Active Record
require './config/active_record'

# Load core components
Dir["./core/**/*.rb"].each{|f| require f}

# Load factories for seeding
Dir["./spec/core/**/factories/*.rb"].each{|f| require f}
