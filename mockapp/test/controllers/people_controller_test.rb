require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    @address = addresses(:one)
    @email = emails(:one)
    @phone_number = phone_numbers(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: {
        person: {
          salutation: @person.salutation,
          first_name: @person.first_name,
          middle_name: @person.middle_name,
          last_name: @person.last_name,
          ssn: @person.ssn,
          birth_date: @person.birth_date
        }
      }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: {
      person: {
        salutation: @person.salutation,
        first_name: @person.first_name,
        middle_name: @person.middle_name,
        last_name: @person.last_name,
        ssn: @person.ssn,
        birth_date: @person.birth_date
      }
    }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person and its associated records" do
    assert_difference('Person.count', -1) do
      assert_difference('Address.count', -1) do
        assert_difference('Email.count', -1) do
          assert_difference('PhoneNumber.count', -1) do
            delete person_url(@person)
          end
        end
      end
    end

    assert_redirected_to people_url
  end
end
