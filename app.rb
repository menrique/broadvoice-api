# Load environment
require './config/environment'

# Load sinatra extensions
require "sinatra/reloader" if development?
require 'sinatra/namespace'
require 'sinatra/json'

# Load component routes
Dir["./components/**/routes.rb"].each{ |file| require file }

# Default route
get '/' do
  redirect '/people'
end

# Not found handling
not_found do
  json Helpers::Errors.handle(Exception.new('Route not found'))
end

# Common error handling
error do
  json Helpers::Errors.handle(env['sinatra.error'])
end