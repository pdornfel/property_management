require 'spec_helper'

feature "An associate can correlate a building with an owner", %q{
    As a real estate associate
    I want to correlate an owner with buildings
    So that I can refer back to pertinent information
} do

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario "When recording a building an associate can optionally associate a building with an owner" do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.build(:building)
    visit 'buildings/new'
    fill_in "Address", with: building.address
    fill_in "City", with: building.city
    select building.state, from: "State"
    fill_in "Zip Code", with: building.zip_code
    select owner.first_name, from: "Owner"
    click_button "Add Building"
    expect(page).to have_content "Building was created successfully"
    expect(owner.buildings.count).to eq 1

  end

  scenario "If an owner is deleted, all associations to buildings are removed"

end