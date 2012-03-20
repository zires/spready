require 'test_helper'

class Admin::TopicsControllerTest < ActionController::TestCase
  setup do
    @admin_topic = admin_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_topic" do
    assert_difference('Admin::Topic.count') do
      post :create, admin_topic: @admin_topic.attributes
    end

    assert_redirected_to admin_topic_path(assigns(:admin_topic))
  end

  test "should show admin_topic" do
    get :show, id: @admin_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_topic
    assert_response :success
  end

  test "should update admin_topic" do
    put :update, id: @admin_topic, admin_topic: @admin_topic.attributes
    assert_redirected_to admin_topic_path(assigns(:admin_topic))
  end

  test "should destroy admin_topic" do
    assert_difference('Admin::Topic.count', -1) do
      delete :destroy, id: @admin_topic
    end

    assert_redirected_to admin_topics_path
  end
end
