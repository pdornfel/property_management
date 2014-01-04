require 'spec_helper'

feature "Associate can view all buildings and owners" do

    scenario "An associate visits the index action of buildings" do
      FactoryGirl.create_list(:building, 3)
      visit buildings_path
      expect(page).to have_content "Total number of buildings: 3"
    end

    scenario "An assocaite visits the index action of owners" do
      FactoryGirl.create_list(:owner, 3)
      visit owners_path
      expect(page).to have_content "Total number of owners: 3"
    end

end