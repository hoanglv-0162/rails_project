require "application_system_test_case"

class FavoriteSongsTest < ApplicationSystemTestCase
  setup do
    @favorite_song = favorite_songs(:one)
  end

  test "visiting the index" do
    visit favorite_songs_url
    assert_selector "h1", text: "Favorite Songs"
  end

  test "creating a Favorite song" do
    visit favorite_songs_url
    click_on "New Favorite Song"

    fill_in "Song", with: @favorite_song.song_id
    fill_in "User", with: @favorite_song.user_id
    click_on "Create Favorite song"

    assert_text "Favorite song was successfully created"
    click_on "Back"
  end

  test "updating a Favorite song" do
    visit favorite_songs_url
    click_on "Edit", match: :first

    fill_in "Song", with: @favorite_song.song_id
    fill_in "User", with: @favorite_song.user_id
    click_on "Update Favorite song"

    assert_text "Favorite song was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite song" do
    visit favorite_songs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite song was successfully destroyed"
  end
end
