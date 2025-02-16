require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  test "should get show" do
    user = users(:one)
    get users_show_url(user)
    assert_response :success
end
end
