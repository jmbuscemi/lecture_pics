require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "successful login" do
    get login_path

    assert_select "input[type='password']", 1
    post login_path, email: "lottie@email.com", password: "password"
    assert_redirected_to root_path

    follow_redirect!
    assert_template "show"
    assert response.body.match("Lottie")

    assert_select "a[href='#{logout_path}']"

    get logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_select "input[type='password']"
    assert response.body.match("Logout successful.")
  end

  test "can't view anything witout logging in" do
    get user_path(users(:one).id)
    assert_redirected_to login_path
    follow_redirect!
    assert_template "new"
  end

  test "wrong login credentials" do
    get login_path
    post login_path, email: "lottie@email.com", password: "junk"
    assert_template "new"
    post login_path, email: "wrong@email.com", password: "junk"
    assert_template "new"
  end
end
