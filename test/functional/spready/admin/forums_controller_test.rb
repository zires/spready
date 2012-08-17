require 'test_helper'

class Spready::Admin::ForumsControllerTest < ActionController::TestCase
  setup do
    @spready_admin_forum = spready_admin_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spready_admin_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spready_admin_forum" do
    assert_difference('Spready::Admin::Forum.count') do
      post :create, spready_admin_forum: {  }
    end

    assert_redirected_to spready_admin_forum_path(assigns(:spready_admin_forum))
  end

  test "should show spready_admin_forum" do
    get :show, id: @spready_admin_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spready_admin_forum
    assert_response :success
  end

  test "should update spready_admin_forum" do
    put :update, id: @spready_admin_forum, spready_admin_forum: {  }
    assert_redirected_to spready_admin_forum_path(assigns(:spready_admin_forum))
  end

  test "should destroy spready_admin_forum" do
    assert_difference('Spready::Admin::Forum.count', -1) do
      delete :destroy, id: @spready_admin_forum
    end

    assert_redirected_to spready_admin_forums_path
  end
end
