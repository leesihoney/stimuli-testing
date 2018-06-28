# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
HEROKU_DEBUG_RAILS_RUNNER=1

run Rails.application
