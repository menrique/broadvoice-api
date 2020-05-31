# Load sinatra extensions
require 'sinatra/namespace'
require 'sinatra/json'

# Configure reloader
if development?
  require "sinatra/reloader"

  Dir["./config/**/*.rb", "./app.rb", "./core/**/*.rb", "./api/**/*.rb",].each{ |file| also_reload file }
  after_reload do
    puts 'App reloaded!'
  end
end