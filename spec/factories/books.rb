FactoryBot.define do
    factory :book do
      sequence(:title) { |n| "Book Title #{n}" }
      author { Faker::Book.author }
      sequence(:isbn) { |n| "978-#{n.to_s.rjust(10, '0')}" }
      description { Faker::Lorem.paragraph }
      image_url { Rails.env.test? ? "https://via.placeholder.com/150" : "https://your-production-url.com/your-image.jpg" }

      after(:build) do |book|
        # Ensure the ISBN is unique across all books in the database
        loop do
          random_isbn = "978-#{rand(1000000000..9999999999)}"
          break if Book.where(isbn: random_isbn).empty?

          # Assign the unique ISBN to the book
          book.isbn = random_isbn
        end
      end
    end
  end
