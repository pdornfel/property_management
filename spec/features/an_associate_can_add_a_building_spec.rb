require 'spec_helper'

feature "An associate can add a building", %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

    # I must specify a street address, city, state, and postal code
    # Only US states can be specified
    # I can optionally specify a description of the building
    # If I enter all of the required information in the required format, the building is recorded.
    # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
    # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario "An associate enters all valid and required information" do
    visit 'buildings/new'
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "02111"
    fill_in "Description", with: "A very nice building"
    click_button "Add Building"

    expect(page).to have_content "Building was created successfully"
    expect(page).to have_button "Add Building"
  end

  scenario "An associate does not specify all the required information when enterting a buildings" do
    visit 'buildings/new'
    click_button "Add Building"

    expect(page).to have_content "can't be blank"
  end


  scenario "An associate can only select US states" do
    page.has_select?('State', with_options: ['Maine', 'New York', 'Wyoming'])
  end

  scenario "An associate can optionally specify a description of the building" do
    visit 'buildings/new'
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "02111"
    click_button "Add Building"

    expect(page).to have_content "Building was created successfully"
    expect(page).to have_content "Add Building"
  end

  scenario "After creating a building an associate is redirected to record another building" do
    visit 'buildings/new'
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    select "Massachusetts", from: "State"
    fill_in "Zip Code", with: "02111"
    click_button "Add Building"

    current_path.should eq "/buildings/new"
  end

  scenario "visiting root path displays navigation bar" do
    visit root_path
    expect(page).to have_content "All Buildings"
    expect(page).to have_content "Add Buildings"
    expect(page).to have_content "All Owners"
    expect(page).to have_content "Add Owners"
  end

end