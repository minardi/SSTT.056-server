require 'test_helper'

class BacklogItemsControllerTest < ActionController::TestCase
  setup do
    @backlog_item = backlog_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backlog_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backlog_item" do
    assert_difference('BacklogItem.count') do
      post :create, backlog_item: { description: @backlog_item.description, estimation: @backlog_item.estimation, item_type: @backlog_item.item_type, parent_id: @backlog_item.parent_id, status: @backlog_item.status, title: @backlog_item.title }
    end

    assert_redirected_to backlog_item_path(assigns(:backlog_item))
  end

  test "should show backlog_item" do
    get :show, id: @backlog_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backlog_item
    assert_response :success
  end

  test "should update backlog_item" do
    patch :update, id: @backlog_item, backlog_item: { description: @backlog_item.description, estimation: @backlog_item.estimation, item_type: @backlog_item.item_type, parent_id: @backlog_item.parent_id, status: @backlog_item.status, title: @backlog_item.title }
    assert_redirected_to backlog_item_path(assigns(:backlog_item))
  end

  test "should destroy backlog_item" do
    assert_difference('BacklogItem.count', -1) do
      delete :destroy, id: @backlog_item
    end

    assert_redirected_to backlog_items_path
  end
end
