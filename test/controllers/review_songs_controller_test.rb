require 'test_helper'

class ReviewSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_song = review_songs(:one)
  end

  test "should get index" do
    get review_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_review_song_url
    assert_response :success
  end

  test "should create review_song" do
    assert_difference('ReviewSong.count') do
      post review_songs_url, params: { review_song: { review: @review_song.review, song_id: @review_song.song_id, user_id: @review_song.user_id } }
    end

    assert_redirected_to review_song_url(ReviewSong.last)
  end

  test "should show review_song" do
    get review_song_url(@review_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_song_url(@review_song)
    assert_response :success
  end

  test "should update review_song" do
    patch review_song_url(@review_song), params: { review_song: { review: @review_song.review, song_id: @review_song.song_id, user_id: @review_song.user_id } }
    assert_redirected_to review_song_url(@review_song)
  end

  test "should destroy review_song" do
    assert_difference('ReviewSong.count', -1) do
      delete review_song_url(@review_song)
    end

    assert_redirected_to review_songs_url
  end
end
