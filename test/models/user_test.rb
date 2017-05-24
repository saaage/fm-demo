# user_test.rb runs assertions against our User model to make sure it functions as intended. User.rb should validate a name, email address, and save to the database.

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # before each test, run the following
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
    # does @user.valid return true?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
    # does @user.valid return false when it contains empty value for name?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
    # does @user.valid return false when it contains empty value for name?
  end

  test "should validate email address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    # an array of valid email addresses

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
    # for each email in the array, check validity and return any failing email addresses
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    # email when converted to uppercase for comparison, should not match an existing email in the database
  end

  test "email should be saved as lower-case" do
    mixed_case_email = "FoO@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
    # this tests that User.rb converts our mixed_case_email back to lower-case before saving
  end

end
