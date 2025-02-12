# Clear existing data
puts "🗑  Clearing old data..."
Borrowing.destroy_all
Review.destroy_all
Book.destroy_all
User.destroy_all

puts "📚 Seeding Books..."

books = [
  { title: "The Hobbit", author: "J.R.R. Tolkien", isbn: "9780261103283",
    description: "A classic adventure about Bilbo Baggins, a hobbit who embarks on an epic quest.",
    image_url: "the_hobbit.jpeg" }, # ✅ No `/assets/` prefix, use correct filename

  { title: "1984", author: "George Orwell", isbn: "9780451524935",
    description: "A dystopian novel about a totalitarian regime controlling every aspect of life.",
    image_url: "1984.webp" },

  { title: "To Kill a Mockingbird", author: "Harper Lee", isbn: "9780061120084",
    description: "A powerful story of racial injustice and moral growth in the American South.",
    image_url: "to_kill_a_mockingbird.webp" },

  { title: "Pride and Prejudice", author: "Jane Austen", isbn: "9780141199078",
    description: "A timeless romance novel exploring themes of love and social class.",
    image_url: "pride_and_prejudice.webp" },

  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "9780743273565",
    description: "A critique of the American Dream set in the roaring twenties.",
    image_url: "the_great_gatsby.webp" },

  { title: "Moby Dick", author: "Herman Melville", isbn: "9781503280786",
    description: "A thrilling tale of obsession and revenge against the great white whale.",
    image_url: "moby_dick.webp" },

  { title: "War and Peace", author: "Leo Tolstoy", isbn: "9780199232765",
    description: "A grand epic novel blending history, war, and human experience.",
    image_url: "war_and_peace.webp" },

  { title: "Brave New World", author: "Aldous Huxley", isbn: "9780060850524",
    description: "A futuristic dystopian society shaped by technology and mind control.",
    image_url: "brave_new_world.webp" },

  { title: "The Catcher in the Rye", author: "J.D. Salinger", isbn: "9780316769488",
    description: "A coming-of-age story exploring teenage angst and alienation.",
    image_url: "the_catcher_in_the_rye.webp" },

  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", isbn: "9780261102385",
    description: "An epic fantasy trilogy about the battle between good and evil.",
    image_url: "the_lord_of_the_rings.jpeg" }
]

books.each do |book_attrs|
  book = Book.create(book_attrs)
  if book.persisted?
    puts "✅ Book added: #{book.title}"
  else
    puts "❌ Failed to add book: #{book.title}"
    book.errors.full_messages.each { |msg| puts "   - #{msg}" }
  end
end

puts "✅ Seeding complete! 📚"
