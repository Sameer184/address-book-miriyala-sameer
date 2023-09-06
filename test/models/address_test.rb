require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
    @address = addresses(:one)
  end

  test "should be valid when all attributes are set" do
    assert @address.valid?
  end

  test "should be invalid without street" do
    @address.street = nil
    assert_not @address.valid?
  end

  test "should be invalid without town" do
    @address.town = nil
    assert_not @address.valid?
  end

  test "should be invalid without zip_code" do
    @address.zip_code = nil
    assert_not @address.valid?
  end

  test "should be invalid with a non-listed country" do
    @address.country = 'USA'
    assert_not @address.valid?
  end

  test "should be valid with a listed country" do
    # Choose a country that exists in your countries.json
    @address.country = 'United States' 
    assert @address.valid?
  end
end
