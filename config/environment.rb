# Load environment variables
require 'dotenv/load'

# Configure Sinatra
require './config/sinatra'

# Configure Active Record
require './config/active_record'

# Load models and services
Dir["./components/**/models/*.rb"].each{ |file| require file }
Dir["./components/**/services/*.rb"].each{ |file| require file }