require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: {user_id: @user.id, uploaded_file_file_name: "example.jpg",
          uploaded_file_content_type: "", uploaded_file_file_size: "",
          uploaded_file_updated_at: "" }
    end

    assert_redirected_to root_path
  end

  test "should show picture" do
    get :show, id: @picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture
    assert_response :success
  end

  test "should update picture" do
    patch :update, id: @picture, picture: { uploaded_file_file_name: "example.jpg",
        user_id: @user.id }
    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_redirected_to pictures_path
  end
end
