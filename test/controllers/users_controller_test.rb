require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Devise::Test::IntegrationHelpers

  test "should get show" do
    user = FactoryBot.create(:user)
    puts "User created: #{user.inspect}"  # Debugging line
    sign_in user
    get user_url(user)
    assert_response :success
  end  
end
