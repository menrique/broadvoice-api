source 'https://rubygems.org'

# Sinatra framework
gem 'sinatra'
gem 'sinatra-contrib', require: false

# Web server
gem 'puma'

# Persistence layer
gem "sinatra-activerecord"
gem "sqlite3"
gem "rake", require: false

# Data generators
gem 'faker', require: true
gem 'factory_bot'

group :development, :test do

  # Shim to load environment variables from .env into ENV
  gem 'dotenv'

  # Manage Procfile-based applications
  gem 'foreman'
end

group :test do

  # Behaviour Driven Development for Ruby
  gem 'rspec'
  gem 'shoulda-matchers'
end