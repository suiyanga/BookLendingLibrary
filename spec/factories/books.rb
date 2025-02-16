FactoryBot.define do
    factory :book do
      sequence(:title) { |n| "Book Title #{n}" }
      author { Faker::Book.author }
      sequence(:isbn) { |n| "978-#{n.to_s.rjust(10, '0')}" }
      description { Faker::Lorem.paragraph }
      image_url { Rails.env.test? ? "https://via.placeholder.com/150" : "https://your-production-url.com/your-image.jpg" }


      after(:build) do |book|
        # Make sure the ISBN is unique
        book.isbn = "978-#{rand(1000000000..9999999999)}" until Book.where(isbn: book.isbn).empty?
      end
    end
  end
