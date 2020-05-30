# Mount components routes
Dir["./components/**/routes.rb"].each{ |file| require file }

# Default
get '/' do
  redirect '/cities'
end

# Not found handling
not_found do
  json Presenters::Error.present(Exception.new('Route not found'))
end

# Common error handling
error do
  json Presenters::Error.present(env['sinatra.error'])
end