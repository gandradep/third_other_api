require "test_helper"

class ShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get shows_url, as: :json
    assert_response :success
  end

  test "should create show" do
    assert_difference("Show.count") do
      post shows_url, params: { show: { date: @show.date, description: @show.description, picture: @show.picture, show_recording_link: @show.show_recording_link, time: @show.time, title: @show.title, url_flyer: @show.url_flyer, venue_id: @show.venue_id } }, as: :json
    end

    assert_response :created
  end

  test "should show show" do
    get show_url(@show), as: :json
    assert_response :success
  end

  test "should update show" do
    patch show_url(@show), params: { show: { date: @show.date, description: @show.description, picture: @show.picture, show_recording_link: @show.show_recording_link, time: @show.time, title: @show.title, url_flyer: @show.url_flyer, venue_id: @show.venue_id } }, as: :json
    assert_response :success
  end

  test "should destroy show" do
    assert_difference("Show.count", -1) do
      delete show_url(@show), as: :json
    end

    assert_response :no_content
  end
end
