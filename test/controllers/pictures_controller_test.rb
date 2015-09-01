require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:one)
    @user = users(:one)
  end

  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: { user_id: @user.id, uploaded_file_file_name: "example.jpg" }
    end

    assert_redirected_to root_path
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_redirected_to pictures_path
  end
end
