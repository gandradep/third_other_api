require "test_helper"

class PerformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @performance = performances(:one)
  end

  test "should get index" do
    get performances_url, as: :json
    assert_response :success
  end

  test "should create performance" do
    assert_difference("Performance.count") do
      post performances_url, params: { performance: { description: @performance.description, recording_link: @performance.recording_link, show_id: @performance.show_id, url_picture_show: @performance.url_picture_show } }, as: :json
    end

    assert_response :created
  end

  test "should show performance" do
    get performance_url(@performance), as: :json
    assert_response :success
  end

  test "should update performance" do
    patch performance_url(@performance), params: { performance: { description: @performance.description, recording_link: @performance.recording_link, show_id: @performance.show_id, url_picture_show: @performance.url_picture_show } }, as: :json
    assert_response :success
  end

  test "should destroy performance" do
    assert_difference("Performance.count", -1) do
      delete performance_url(@performance), as: :json
    end

    assert_response :no_content
  end
end
