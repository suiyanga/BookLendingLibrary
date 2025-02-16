require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rspec/rails'
require 'devise'
require 'shoulda/matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Devise configuration
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include FactoryBot::Syntax::Methods

  # Ensure data is created before each test
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.create(:user) unless User.exists?
    FactoryBot.create(:book) unless Book.exists?
  end

  config.before(:each, type: :controller) do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
