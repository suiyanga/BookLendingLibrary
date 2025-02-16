# test/controllers/books_controller_test.rb
class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    book = FactoryBot.create(:book, image_url: "https://via.placeholder.com/150")  # Ensure image_url is set
    get books_path  # Change from books_index_url to books_path to match your route
    assert_response :success
  end

  test "should get show" do
    book = FactoryBot.create(:book, image_url: "https://via.placeholder.com/150")
    get book_path(book)  # Ensure you pass a valid book instance
    assert_response :success
  end
end
