# Configure reloading app on development
if development?
  require "sinatra/reloader"

  Dir["./**/*.rb"].each{ |file| also_reload file }
  after_reload do
    puts 'App reloaded!'
  end
end