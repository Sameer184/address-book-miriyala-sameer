require 'test_helper'

class Api::V1::PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get api_v1_people_url, as: :json
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post api_v1_people_url, params: { person: { salutation: 'Mr.', first_name: 'Tommy', last_name: 'Shelby' } }, as: :json
    end
    assert_response :created
  end

  test "should show person" do
    get api_v1_person_url(@person), as: :json
    assert_response :success
  end

  test "should update person" do
    patch api_v1_person_url(@person), params: { person: { middle_name: 'Blinder' } }, as: :json
    assert_response :success
  end

  test "should not update person with invalid params" do
    patch api_v1_person_url(@person), params: { person: { first_name: nil } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete api_v1_person_url(@person), as: :json
    end
    assert_response :success
  end

  test "should return not found when trying to get a non-existing person" do
    get api_v1_person_url(id: "invald-id"), as: :json
    assert_response :not_found
  end
end
