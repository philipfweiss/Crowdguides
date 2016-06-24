require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
   @user = User.new(name: "Philip Weiss", email: "weissp68@stanford.edu")
 end

  test "User is valid" do
    @user.valid?
  end

  test "Name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "Email should be valid" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "Email should not be too long" do
    @user.email = 'a'*255 + "example.com"
    assert_not @user.valid?
  end

  test "Name should not be too long do" do
    @user.name = 'a'*51
    assert_not @user.valid?
  end
end
