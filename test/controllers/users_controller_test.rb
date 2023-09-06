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

  test "should not create user with invalid info" do
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username: "", email: "newuser@test", password: "password", password_confirmation: "password" } }
    end
    assert_redirected_to new_user_path
    assert_not_empty flash[:danger]
  end

  test "should show specific error for username" do
    post users_path, params: { user: { username: "", email: "valid@example.com", password: "password123", password_confirmation: "password123" } }
    assert_redirected_to new_user_path
    assert_equal "Username can't be blank", flash[:danger]
  end

  test "should show specific error for email" do
    post users_path, params: { user: { username: "validuser", email: "", password: "password123", password_confirmation: "password123" } }
    assert_redirected_to new_user_path
    assert_equal "Email can't be blank, Email is invalid", flash[:danger]
  end

  test "should show specific error for password mismatch" do
    post users_path, params: { user: { username: "validuser", email: "valid@example.com", password: "password", password_confirmation: "mismatch" } }
    assert_redirected_to new_user_path
    assert_equal "Password confirmation doesn't match Password", flash[:danger]
  end
end
