require 'test_helper'

class Api::V1::EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    @email = emails(:one)
  end

  test "should get index" do
    get api_v1_person_emails_url(@person.id), as: :json
    assert_response :success
    assert_not_nil JSON.parse(response.body)
  end

  test "should create email" do
    assert_difference('Email.count') do
      post api_v1_person_emails_url(@person.id),
           params: { email: { email_address: 'new_email@example.com', comment: 'New Comment' } },
           as: :json
    end
    assert_response :created
  end

  test "should not create email with invalid data" do
    assert_no_difference('Email.count') do
      post api_v1_person_emails_url(@person.id),
           params: { email: { email_address: 'invalid_email', comment: 'New Comment' } },
           as: :json
    end
    assert_response :unprocessable_entity
  end

  test "should show email" do
    get api_v1_person_email_url(@person.id, @email.id), as: :json
    assert_response :success
    assert_not_nil JSON.parse(response.body)
  end

  test "should update email" do
    patch api_v1_person_email_url(@person.id, @email.id),
          params: { email: { email_address: 'updated_email@example.com', comment: '' } },
          as: :json
    assert_response :success
  end

  test "should not update email with invalid data" do
    patch api_v1_person_email_url(@person.id, @email.id),
          params: { email: { email_address: 'invalid_email', comment: '' } },
          as: :json
    assert_response :unprocessable_entity
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete api_v1_person_email_url(@person.id, @email.id), as: :json
    end
    assert_response :success
  end

  test "should not get email of non-existing person" do
    get api_v1_person_email_url(-1, @email.id), as: :json
    assert_response :not_found
  end

  test "should not get non-existing email" do
    get api_v1_person_email_url(@person.id, -1), as: :json
    assert_response :not_found
  end
end
