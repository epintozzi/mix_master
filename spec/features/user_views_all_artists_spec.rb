require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see each artist on the index page" do

    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    Artist.create(name: "Elvis Presley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/993/MI0003993792.jpg?partner=allrovi.com")

    visit artists_path

    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Elvis Presley"

    expect(page).to have_link "Bob Marley"
    expect(page).to have_link "Elvis Presley"
  end
end
