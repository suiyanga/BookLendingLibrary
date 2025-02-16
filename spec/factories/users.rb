FactoryBot.define do
    factory :user do
      email { "user#{Faker::Number.unique.number(digits: 5)}@example.com" }
      password { "password" }
      password_confirmation { "password" }
    end
  end
  