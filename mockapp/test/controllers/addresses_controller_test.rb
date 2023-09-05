require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
    @address = addresses(:one)
  end

  test "should get index" do
    get person_addresses_url(@person)
    assert_response :success
  end

  test "should get new" do
    get new_person_address_url(@person)
    assert_response :success
  end

  test "should create address" do
    assert_difference("Address.count") do
      post person_addresses_url(@person), params: { address: { street: "Parks Place", town: "McKinney", zip_code: "760224", state: "LoneStar", country: "United States" } }
    end

    assert_redirected_to person_addresses_url(@person)
  end

  test "should get show" do
    get person_address_url(@person, @address)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_address_url(@person, @address)
    assert_response :success
  end

  test "should update address" do
    patch person_address_url(@person, @address), params: { address: { street: "Updated St" } }
    assert_redirected_to person_addresses_url(@person)
    @address.reload
    assert_equal "Updated St", @address.street
  end

  test "should destroy address" do
    assert_difference("Address.count", -1) do
      delete person_address_url(@person, @address)
    end

    assert_redirected_to person_addresses_url(@person)
  end
end
