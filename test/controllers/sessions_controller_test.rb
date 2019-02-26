require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should be able to login" do
    get sign_in_path
    post session_path, params: {session: {email: "email@test.com", password: "password"}}
    assert_response :redirect
    follow_redirect!
    follow_redirect!
    assert_match "Sign Out", response.body
    get profile_path(as: User.find(1))
    assert_match "email@test.com", response.body
  end

  test "should be able to sign up" do 
  	 get sign_up_path
  	 post users_path, params: { user: { email: "oh@email.com", name: "John", password: "secretPassword"} }
     assert_response :redirect
     follow_redirect!
     follow_redirect!
     assert_match "Sign Out", response.body
  end
end