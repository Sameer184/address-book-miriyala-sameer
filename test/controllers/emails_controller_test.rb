require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    @email = emails(:one)
  end

  test "should get index" do
    get person_emails_url(@person)
    assert_response :success
  end

  test "should get new" do
    get new_person_email_url(@person)
    assert_response :success
  end

  test "should create email" do
    assert_difference("Email.count") do
      post person_emails_url(@person), params: { email: { email_address: "test@example.com", comment: "Test email" } }
    end

    assert_redirected_to person_emails_url(@person)
  end

  test "should get show" do
    get person_email_url(@person, @email)
    assert_response :success
  end

  test "should not create email with invalid data" do
    assert_no_difference("Email.count") do
      post person_emails_url(@person), params: { email: { email_address: "invalid-email", comment: "Invalid email" } }
    end

    assert_response :success
  end

  test "should get edit" do
    get edit_person_email_url(@person, @email)
    assert_response :success
  end

  test "should update email" do
    patch person_email_url(@person, @email), params: { email: { email_address: "updated@example.com" } }
    assert_redirected_to person_emails_url(@person)
    @email.reload
    assert_equal "updated@example.com", @email.email_address
  end

  test "should not update email with invalid data" do
    patch person_email_url(@person, @email), params: { email: { email_address: "invalid-email" } }
    assert_response :success
    @email.reload
    assert_not_equal "invalid-email", @email.email_address
  end


  test "should destroy email" do
    assert_difference("Email.count", -1) do
      delete person_email_url(@person, @email)
    end

    assert_redirected_to person_emails_url(@person)
  end
end
