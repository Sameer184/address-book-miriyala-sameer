require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
    @phone_number = phone_numbers(:one)
  end

  test "should be valid" do
    assert @phone_number.valid?
  end

  test "phone_number should be present" do
    @phone_number.phone_number = ''
    assert_not @phone_number.valid?
  end

  test "phone_number should be 10 digits" do
    @phone_number.phone_number = '12345'
    assert_not @phone_number.valid?
    @phone_number.phone_number = '12345678901'
    assert_not @phone_number.valid?
  end

  test "phone_number should be numeric" do
    @phone_number.phone_number = '123456789a'
    assert_not @phone_number.valid?
    @phone_number.phone_number = '123456789!'
    assert_not @phone_number.valid?
  end
end
