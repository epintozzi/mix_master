require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they delete an artist and artist no longer appears on index" do

    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    Artist.create(name: "Elvis Presley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/993/MI0003993792.jpg?partner=allrovi.com")

    visit artists_path
    click_on "Elvis Presley"
    click_on "Delete"

    expect(page).to have_content "Bob Marley"
    expect(page).to_not have_content "Elvis Presley"
  end
end
