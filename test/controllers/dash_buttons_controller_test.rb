require 'test_helper'

class DashButtonsControllerTest < ActionController::TestCase
  setup do
    @dash_button = dash_buttons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dash_buttons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dash_button" do
    assert_difference('DashButton.count') do
      post :create, dash_button: { btn_content: @dash_button.btn_content, btn_type: @dash_button.btn_type, permission: @dash_button.permission }
    end

    assert_redirected_to dash_button_path(assigns(:dash_button))
  end

  test "should show dash_button" do
    get :show, id: @dash_button
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dash_button
    assert_response :success
  end

  test "should update dash_button" do
    patch :update, id: @dash_button, dash_button: { btn_content: @dash_button.btn_content, btn_type: @dash_button.btn_type, permission: @dash_button.permission }
    assert_redirected_to dash_button_path(assigns(:dash_button))
  end

  test "should destroy dash_button" do
    assert_difference('DashButton.count', -1) do
      delete :destroy, id: @dash_button
    end

    assert_redirected_to dash_buttons_path
  end
end
