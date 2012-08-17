require 'test_helper'

class Admin::Spready::ForumsControllerTest < ActionController::TestCase
  setup do
    @admin_spready_forum = admin_spready_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_spready_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_spready_forum" do
    assert_difference('Admin::Spready::Forum.count') do
      post :create, admin_spready_forum: {  }
    end

    assert_redirected_to admin_spready_forum_path(assigns(:admin_spready_forum))
  end

  test "should show admin_spready_forum" do
    get :show, id: @admin_spready_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_spready_forum
    assert_response :success
  end

  test "should update admin_spready_forum" do
    put :update, id: @admin_spready_forum, admin_spready_forum: {  }
    assert_redirected_to admin_spready_forum_path(assigns(:admin_spready_forum))
  end

  test "should destroy admin_spready_forum" do
    assert_difference('Admin::Spready::Forum.count', -1) do
      delete :destroy, id: @admin_spready_forum
    end

    assert_redirected_to admin_spready_forums_path
  end
end
