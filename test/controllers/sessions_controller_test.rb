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

  test "should not log in invalid user" do
    get login_path
    post login_path, params: { email: "", password: "" }
    assert_response :success
    assert_not flash.empty?
    assert_select "form[action=?]", login_path
  end
end
