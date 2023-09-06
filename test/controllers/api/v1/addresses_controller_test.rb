require 'test_helper'

module Api
  module V1
    class AddressesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @person = people(:one)
        @address = addresses(:one)
      end

      test "should get index" do
        get api_v1_person_addresses_url(@person)
        assert_response :success
      end

      test "should show address" do
        get api_v1_person_address_url(@person, @address)
        assert_response :success
      end

      test "should create address" do
        assert_difference('@person.addresses.count', 1) do
          post api_v1_person_addresses_url(@person), params: { address: { street: '848 W Mitchell St', town: 'Arlington', zip_code: '12345', state: 'Texas', country: 'United States' } }
        end
        assert_response :created
      end

      test "should not create address with invalid params" do
        post api_v1_person_addresses_url(@person), params: { address: { street: '', town: '', zip_code: '', country: 'USA' } }
        assert_response :unprocessable_entity
      end

      test "should update address" do
        patch api_v1_person_address_url(@person, @address), params: { address: { street: '920 E St' } }
        assert_response :success
      end

      test "should not update address with invalid params" do
        patch api_v1_person_address_url(@person, @address), params: { address: { street: '' } }
        assert_response :unprocessable_entity
      end

      test "should destroy address" do
        assert_difference('@person.addresses.count', -1) do
          delete api_v1_person_address_url(@person, @address)
        end
        assert_response :success
      end

      test "should return not found when person does not exist" do
        get api_v1_person_addresses_url(-1)
        assert_response :not_found
      end

      test "should return not found when address does not exist" do
        get api_v1_person_address_url(@person, -1)
        assert_response :not_found
      end
    end
  end
end
