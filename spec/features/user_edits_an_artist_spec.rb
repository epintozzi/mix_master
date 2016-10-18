require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they edit an artist from the individual artist's page" do

    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist = Artist.create(name: "Bob Marley", image_path: artist_image_path)

    artist_name = "John Mayer"

    visit artist_path(artist)

    click_on "Edit"
    fill_in "artist_name", with: artist_name
    click_on "Update Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they are redirected to edit page" do
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      artist = Artist.create(name: "Bob Marley", image_path: artist_image_path)

      artist_name =

      visit artist_path(artist)

      click_on "Edit"
      fill_in "artist_name", with: artist_name
      click_on "Update Artist"

      expect(page).to have_content "Edit"
    end
  end

end
