# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Spready::Application.initialize!

# Initialize site
Site.initialize!
