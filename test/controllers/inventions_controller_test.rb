require 'test_helper'

class InventionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invention = inventions(:one)
  end

  test "should get index" do
    get inventions_url
    assert_response :success
  end

  test "should get new" do
    get new_invention_url
    assert_response :success
  end

  test "should create invention" do
    assert_difference('Invention.count') do
      post inventions_url, params: { invention: {  } }
    end

    assert_redirected_to invention_url(Invention.last)
  end

  test "should show invention" do
    get invention_url(@invention)
    assert_response :success
  end

  test "should get edit" do
    get edit_invention_url(@invention)
    assert_response :success
  end

  test "should update invention" do
    patch invention_url(@invention), params: { invention: {  } }
    assert_redirected_to invention_url(@invention)
  end

  test "should destroy invention" do
    assert_difference('Invention.count', -1) do
      delete invention_url(@invention)
    end

    assert_redirected_to inventions_url
  end
end
