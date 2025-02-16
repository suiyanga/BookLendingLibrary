require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Devise::Test::IntegrationHelpers

  test "should get show" do
    user = FactoryBot.create(:user)  # Use FactoryBot to create a user
    sign_in user  # Devise method to sign in the user
    get user_url(user)
    assert_response :success
  end
end
