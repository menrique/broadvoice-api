require 'sinatra/activerecord'

configure do
  set :database_file, '../config/database.yml'
end
