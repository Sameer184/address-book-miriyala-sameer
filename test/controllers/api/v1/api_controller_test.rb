require 'test_helper'

module Api
  module V1
    class ApiControllerTest < ActionDispatch::IntegrationTest
      setup do
        @person = people(:one)
      end

      test "should get index" do
        get api_v1_people_url
        assert_response :success
      end

      test "should create person" do
        assert_difference('Person.count') do
          post api_v1_people_url, params: { person: { salutation: @person.salutation, first_name: 'Jane', middle_name: @person.middle_name, last_name: @person.last_name, ssn: @person.ssn, birth_date: @person.birth_date } }
        end
        assert_response :created
      end

      test "should show person" do
        get api_v1_person_url(@person)
        assert_response :success
      end

      test "should update person" do
        patch api_v1_person_url(@person), params: { person: { salutation: 'Mr.', first_name: 'Updated Name' } }
        assert_response :success
      end

      test "should destroy person" do
        assert_difference('Person.count', -1) do
          delete api_v1_person_url(@person)
        end
        assert_response :success
      end

      test "should not find person" do
        get api_v1_person_url(id: 'a')
        assert_response :not_found
      end

      test "should not create person with invalid params" do
        assert_no_difference('Person.count') do
          post api_v1_people_url, params: { person: { salutation: '', first_name: '', middle_name: '', last_name: '', ssn: '', birth_date: '' } }
        end
        assert_response :unprocessable_entity
      end
    end
  end
end
