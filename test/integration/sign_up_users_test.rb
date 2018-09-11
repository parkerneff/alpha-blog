require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest



  test "get new signup form and signup uer" do


    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: {user:{username: "testuser", email: "testuser@example.com", password: "password"}}
      follow_redirect!
    end
    assert_template 'users/show'

    #assert_template 'users/index'
    assert_equal 200, status
    assert_match "testuser's", response.body
  end



end