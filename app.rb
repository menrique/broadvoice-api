# Load environment
require './config/environment'

# Load sinatra extensions
require './config/extensions'

# Load API components
Dir["./api/**/*.rb"].sort.each{ |file| require file }