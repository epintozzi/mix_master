require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they edit the name, add, and remove songs" do
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "Song D")

    new_playlist_name = "New Name"

    visit playlist_path(playlist)
    save_and_open_page
    click_on "Edit"
    fill_in "playlist_name", with: new_playlist_name
    check("song-#{new_song.id}")
    uncheck("song-#{third.id}")
    click_on "Update Playlist"
    save_and_open_page

    expect(page).to have_content new_playlist_name
    expect(page).to have_content new_song.title
    expect(page).to_not have_content third.title
  end
end
