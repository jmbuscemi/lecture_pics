require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "new_user.email", first_name: @user.first_name,
          last_name: @user.last_name, password: "password" }
    end

    assert_redirected_to root_path
  end

  test "should get my_profile page" do
    get :my_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, first_name: @user.first_name,
        password: "password" }
    assert_redirected_to my_profile_path
  end

  test "should update user without password change" do
    patch :update, id: @user, user: { email: @user.email, first_name: @user.first_name }
    assert_redirected_to my_profile_path
  end

  test "should not update user" do
    patch :update, id: @user, user: { email: @user.email, first_name: @user.first_name,
        password: "wrong" }
    assert_template :edit
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
