require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  def setup
    @person = people(:one)
    @email = emails(:one)
  end

  test "should be valid" do
    assert @email.valid?
  end

  test "email_address should be present" do
    @email.email_address = ''
    assert_not @email.valid?
  end

  test "email_address should have valid format" do
    valid_addresses = %w[test@gmail.com user@gmail.co user.name@gmail.com user_name@gmail.com user+name@gmail.com]
    valid_addresses.each do |valid_address|
      @email.email_address = valid_address
      assert @email.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email_address should not have invalid format" do
    invalid_addresses = %w[test.com user@ user@com user_at_example.com user.name@.com]
    invalid_addresses.each do |invalid_address|
      @email.email_address = invalid_address
      assert_not @email.valid?, "#{invalid_address.inspect} should not be valid"
    end
  end
end
