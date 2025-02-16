# spec/support/database_cleaner.rb

RSpec.configure do |config|
    config.before(:suite) do
      # Starts cleaning before the suite starts
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      # Clean up before each test
      DatabaseCleaner.start
    end

    config.after(:each) do
      # Clean up after each test
      DatabaseCleaner.clean
    end
  end
