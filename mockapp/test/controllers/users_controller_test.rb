require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { username: "new_user", email: "new_user@gmail.com", password: "password", password_confirmation: "password" } }
    end

    assert_redirected_to login_path
    assert_equal 'Registration successful! Please log in.', flash[:success]
  end

  test "should not create user with mismatched passwords" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { username: "new_user", email: "new_user@gmail.com", password: "password", password_confirmation: "passwor" } }
    end

    assert_redirected_to new_user_path
    assert_equal 'Password mismatch', flash[:danger]
  end
end
