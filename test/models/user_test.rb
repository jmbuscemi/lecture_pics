require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should display name" do
    assert_equal "Lottie Conroy", @user.name
  end
end
