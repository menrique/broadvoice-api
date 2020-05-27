require 'sinatra'

configure do
  set :show_exceptions, :after_handler
end