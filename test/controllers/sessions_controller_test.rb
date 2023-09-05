require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get login_path
    assert_response :success
    assert_select "form[action=?]", login_path
  end

  test "should log in valid user" do
    post login_path, params: { email: @user.email, password: 'password' }
    assert_redirected_to people_path
    follow_redirect!
    assert_response :success
    assert_not flash.empty?
  end

  test "should not log in invalid user" do
    get login_path
    post login_path, params: { email: "", password: "" }
    assert_response :success
    assert_not flash.empty?
    assert_select "form[action=?]", login_path
  end

  test "should log out" do
    post login_path, params: { email: @user.email, password: 'password' }
    delete logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_response :success
    assert_not flash.empty?
  end
end
