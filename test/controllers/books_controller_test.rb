require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  # Test for index action
  test "should get index" do
    # Use FactoryBot to create a book
    book = FactoryBot.create(:book)

    # Make the request to the index action
    get books_url

    # Assert that the response is successful
    assert_response :success
  end

  # Test for show action
  test "should get show" do
    # Use FactoryBot to create a book
    book = FactoryBot.create(:book)

    # Make the request to the show action with the created book's id
    get books_url(book)

    # Assert that the response is successful
    assert_response :success
  end
end
