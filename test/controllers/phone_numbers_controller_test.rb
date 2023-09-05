require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @person = people(:one)
    @phone_number = phone_numbers(:one)
  end

  test "should get index" do
    get person_phone_numbers_url(@person)
    assert_response :success
  end

  test "should get new" do
    get new_person_phone_number_url(@person)
    assert_response :success
  end

  test "should create phone number" do
    assert_difference('PhoneNumber.count') do
      post person_phone_numbers_url(@person), params: { phone_number: { phone_number: '1234567890', comment: 'Sample comment' } }
    end

    assert_redirected_to person_phone_numbers_url(@person)
  end

  test "should not create phone number with invalid data" do
    assert_no_difference('PhoneNumber.count') do
      post person_phone_numbers_url(@person), params: { phone_number: { phone_number: 'alphabet', comment: 'Invalid number' } }
    end

    @phone_number.reload
    assert_not_equal "alphabet", @phone_number.phone_number
  end

  test "should get edit" do
    get edit_person_phone_number_url(@person, @phone_number)
    assert_response :success
  end

  test "should update phone number" do
    patch person_phone_number_url(@person, @phone_number), params: { phone_number: { phone_number: '9876543210', comment: 'Updated comment' } }
    assert_redirected_to person_phone_numbers_url(@person)

    @phone_number.reload
    assert_equal "9876543210", @phone_number.phone_number
  end

  test "should not update phone number with invalid data" do
    patch person_phone_number_url(@person, @phone_number), params: { phone_number: { phone_number: '1243' } }
    assert_response :success
    @phone_number.reload
    assert_not_equal "1243", @phone_number.phone_number
  end

  test "should destroy phone number" do
    assert_difference('PhoneNumber.count', -1) do
      delete person_phone_number_url(@person, @phone_number)
    end

    assert_redirected_to person_phone_numbers_url(@person)
  end
end
