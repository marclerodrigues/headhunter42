# require 'capybara/rails'
# require 'capybara/rspec'
# require 'capybara/poltergeist'
#
# Capybara.configure do |config|
#   config.default_driver = :poltergeist
#   config.ignore_hidden_elements = true
# end
#
# timeout = ENV.fetch('TEST_TIMEOUT', 10).to_i
#
# Capybara.register_driver :poltergeist do |app|
#   options = {
#     #The dimensions of the browser window in which to test, expressed as a 2-element array,
#     window_size: [1280, 800],
#     timeout: timeout
#   }
#
#   Capybara::Poltergeist::Driver.new(app, options)
# end
#
# Capybara.default_max_wait_time = timeout
