require 'test_helper'

class GuideTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @guide = @user.guides.build(title: "Test Title", description: "Test Description")
  end

  test "should be valid" do
    assert @guide.valid?
  end
  

  test "title should be present" do
    @guide.title = "   "
    assert_not @guide.valid?
  end

  test "title should be at most 200 characters" do
    @guide.title = "a" * 201
    assert_not @guide.valid?
  end

  test "description should be present" do
    @guide.description = "   "
    assert_not @guide.valid?
  end

  test "description should be at most 10,000 chars" do
    @guide.description = "a"*10001
    assert_not @guide.valid?
  end

end