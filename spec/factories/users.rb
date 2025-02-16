FactoryBot.define do
    factory :user do
      email { "user#{Faker::Number.unique.number(digits: 5)}@example.com" }
      password { "password" }
      password_confirmation { "password" }
  
      after(:create) { Faker::UniqueGenerator.clear }  # Ensure uniqueness between tests
    end
  end
  