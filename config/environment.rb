# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load custom application config
APP_CONFIG = YAML.load_file("#{Rails.root}/config/app.yml")[Rails.env]

# Initialize the Rails application.
Melomerezco::Application.initialize!
