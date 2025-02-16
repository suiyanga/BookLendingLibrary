# spec/rails_helper.rb

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rspec/rails'

# Load supporting files
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  # Disable transactional fixtures since we are using DatabaseCleaner
  config.use_transactional_fixtures = false

  # Ensure FactoryBot is loaded
  config.include FactoryBot::Syntax::Methods

  # Automatically infer spec type from the file location
  config.infer_spec_type_from_file_location!

  # Filter out Rails backtrace noise in the logs
  config.filter_rails_from_backtrace!

  # Disable fixtures entirely
  config.fixture_path = nil  # Ensure this is set to nil

  # DatabaseCleaner configuration for cleaning the database between tests
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.create(:user) unless User.exists?
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
