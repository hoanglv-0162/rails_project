require "application_system_test_case"

class ReviewSongsTest < ApplicationSystemTestCase
  setup do
    @review_song = review_songs(:one)
  end

  test "visiting the index" do
    visit review_songs_url
    assert_selector "h1", text: "Review Songs"
  end

  test "creating a Review song" do
    visit review_songs_url
    click_on "New Review Song"

    fill_in "Review", with: @review_song.review
    fill_in "Song", with: @review_song.song_id
    fill_in "User", with: @review_song.user_id
    click_on "Create Review song"

    assert_text "Review song was successfully created"
    click_on "Back"
  end

  test "updating a Review song" do
    visit review_songs_url
    click_on "Edit", match: :first

    fill_in "Review", with: @review_song.review
    fill_in "Song", with: @review_song.song_id
    fill_in "User", with: @review_song.user_id
    click_on "Update Review song"

    assert_text "Review song was successfully updated"
    click_on "Back"
  end

  test "destroying a Review song" do
    visit review_songs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review song was successfully destroyed"
  end
end
