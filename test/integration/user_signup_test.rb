require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest

  test "sign up new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
    	post users_path, params: { user: { username: "spectest", email: "slesperance@conamex.com", password: "password4U"} }
    	assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end



end
