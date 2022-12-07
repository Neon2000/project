require "test_helper"

class CmreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cmreview = cmreviews(:one)
  end

  test "should get index" do
    get cmreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_cmreview_url
    assert_response :success
  end

  test "should create cmreview" do
    assert_difference('Cmreview.count') do
      post cmreviews_url, params: { cmreview: { star: @cmreview.star } }
    end

    assert_redirected_to cmreview_url(Cmreview.last)
  end

  test "should show cmreview" do
    get cmreview_url(@cmreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_cmreview_url(@cmreview)
    assert_response :success
  end

  test "should update cmreview" do
    patch cmreview_url(@cmreview), params: { cmreview: { star: @cmreview.star } }
    assert_redirected_to cmreview_url(@cmreview)
  end

  test "should destroy cmreview" do
    assert_difference('Cmreview.count', -1) do
      delete cmreview_url(@cmreview)
    end

    assert_redirected_to cmreviews_url
  end
end
