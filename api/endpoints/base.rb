# Apply global filters
before do
  params[:query] = Parsers::Query.parse(params)
end

# Redirect to default endpoint
get '/' do
  redirect '/cities'
end

# Not found handling
not_found do
  json Presenters::Error.present(Exception.new('Route not found'))
end

# Base error handling
error do
  json Presenters::Error.present(env['sinatra.error'])
end