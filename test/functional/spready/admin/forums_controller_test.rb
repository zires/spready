require 'test_helper'

module Spready
  class Admin::ForumsControllerTest < ActionController::TestCase
    setup do
      @admin_forum = admin_forums(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:admin_forums)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create admin_forum" do
      assert_difference('Admin::Forum.count') do
        post :create, admin_forum: {  }
      end
  
      assert_redirected_to admin_forum_path(assigns(:admin_forum))
    end
  
    test "should show admin_forum" do
      get :show, id: @admin_forum
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @admin_forum
      assert_response :success
    end
  
    test "should update admin_forum" do
      put :update, id: @admin_forum, admin_forum: {  }
      assert_redirected_to admin_forum_path(assigns(:admin_forum))
    end
  
    test "should destroy admin_forum" do
      assert_difference('Admin::Forum.count', -1) do
        delete :destroy, id: @admin_forum
      end
  
      assert_redirected_to admin_forums_path
    end
  end
end
