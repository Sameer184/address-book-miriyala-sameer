require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
  end

  test "should be valid" do
    assert @person.valid?
  end

  test "first name should be present" do
    @person.first_name = ''
    assert_not @person.valid?
  end

  test "last name should be present" do
    @person.last_name = ''
    assert_not @person.valid?
  end

  test "salutation should be valid" do
    @person.salutation = 'Dr.'
    assert_not @person.valid?
  end

  test "ssn should be numeric and exactly 9 digits" do
    @person.ssn = '1234abcd'
    assert_not @person.valid?
  end

  test "ssn should allow blank" do
    @person.ssn = ''
    assert @person.valid?
  end

  test "ssn should be exactly 9 digits" do
    @person.ssn = '12345'
    assert_not @person.valid?
  end

  test "ssn should be numeric" do
    @person.ssn = '123456789'
    assert @person.valid?
  end

  test "should allow birth_date to be blank" do
    @person.birth_date = ''
    assert @person.valid?
  end
end
