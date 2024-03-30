require "test_helper"

class ArtistPerformancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist_performance = artist_performances(:one)
  end

  test "should get index" do
    get artist_performances_url, as: :json
    assert_response :success
  end

  test "should create artist_performance" do
    assert_difference("ArtistPerformance.count") do
      post artist_performances_url, params: { artist_performance: { artist_id: @artist_performance.artist_id, performance_id: @artist_performance.performance_id } }, as: :json
    end

    assert_response :created
  end

  test "should show artist_performance" do
    get artist_performance_url(@artist_performance), as: :json
    assert_response :success
  end

  test "should update artist_performance" do
    patch artist_performance_url(@artist_performance), params: { artist_performance: { artist_id: @artist_performance.artist_id, performance_id: @artist_performance.performance_id } }, as: :json
    assert_response :success
  end

  test "should destroy artist_performance" do
    assert_difference("ArtistPerformance.count", -1) do
      delete artist_performance_url(@artist_performance), as: :json
    end

    assert_response :no_content
  end
end
