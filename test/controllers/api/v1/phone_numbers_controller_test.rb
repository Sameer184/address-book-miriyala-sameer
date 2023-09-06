require 'test_helper'

module Api
  module V1
    class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @person = people(:one)
        @phone_number = phone_numbers(:one)
      end

      test "should get index" do
        get api_v1_person_phone_numbers_url(@person.id), as: :json
        assert_response :success
        assert_not_nil JSON.parse(response.body)
      end

      test "should create phone number" do
        assert_difference('PhoneNumber.count') do
          post api_v1_person_phone_numbers_url(@person.id),
              params: { phone_number: { phone_number: '1234567890', comment: '' } },
              as: :json
        end
        assert_response :created
      end

      test "should not create phone number with invalid data" do
        assert_no_difference('PhoneNumber.count') do
          post api_v1_person_phone_numbers_url(@person.id),
              params: { phone_number: { phone_number: 'invalid', comment: '' } },
              as: :json
        end
        assert_response :unprocessable_entity
      end

      test "should show phone number" do
        get api_v1_person_phone_number_url(@person.id, @phone_number.id), as: :json
        assert_response :success
        assert_not_nil JSON.parse(response.body)
      end

      test "should update phone number" do
        patch api_v1_person_phone_number_url(@person.id, @phone_number.id),
            params: { phone_number: { phone_number: '0987654321', comment: 'Updated Comment' } },
            as: :json
        assert_response :success
      end

      test "should not update phone number with invalid data" do
        patch api_v1_person_phone_number_url(@person.id, @phone_number.id),
            params: { phone_number: { phone_number: 'invalid', comment: 'Updated Comment' } },
            as: :json
        assert_response :unprocessable_entity
      end

      test "should destroy phone number" do
        assert_difference('PhoneNumber.count', -1) do
          delete api_v1_person_phone_number_url(@person.id, @phone_number.id), as: :json
        end
        assert_response :success
      end

      test "should not get phone number of non-existing person" do
        get api_v1_person_phone_number_url(-1, @phone_number.id), as: :json
        assert_response :not_found
      end

      test "should not get non-existing phone number" do
        get api_v1_person_phone_number_url(@person.id, -1), as: :json
        assert_response :not_found
      end
    end
  end
end
