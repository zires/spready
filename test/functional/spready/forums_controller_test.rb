require 'test_helper'

class Spready::ForumsControllerTest < ActionController::TestCase
  setup do
    @spready_forum = spready_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spready_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spready_forum" do
    assert_difference('Spready::Forum.count') do
      post :create, spready_forum: {  }
    end

    assert_redirected_to spready_forum_path(assigns(:spready_forum))
  end

  test "should show spready_forum" do
    get :show, id: @spready_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spready_forum
    assert_response :success
  end

  test "should update spready_forum" do
    put :update, id: @spready_forum, spready_forum: {  }
    assert_redirected_to spready_forum_path(assigns(:spready_forum))
  end

  test "should destroy spready_forum" do
    assert_difference('Spready::Forum.count', -1) do
      delete :destroy, id: @spready_forum
    end

    assert_redirected_to spready_forums_path
  end
end
