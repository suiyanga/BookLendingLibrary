require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  test "should get index" do
    get books_index_url
    assert_response :success
  end

  test "should get show" do
    book = books(:one) 
    get books_show_url
    assert_response :success
  end
end
