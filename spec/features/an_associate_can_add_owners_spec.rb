require 'spec_helper'

feature "An associate can add owners", %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario "An associate enters in all valid and required attributes with an owner" do
    visit 'owners/new'
    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Dornfeld"
    fill_in "Email", with: "pdornfel@gmail.com"
    fill_in "Company", with: "Launch Academy"
    click_button "Create Owner"

    expect(page).to have_content "Owner was created successfully"
    expect(page).to have_content "Add Owner"
  end

  scenario "An associate enters in an owner without a compnay name" do
    visit 'owners/new'
    click_button "Create Owner"
    expect(page).to have_content "can't be blank"
    expect(page).to have_button "Create Owner"
  end

  scenario "Without the required information errors are given" do
    visit 'owners/new'
    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Dornfeld"
    fill_in "Email", with: "pdornfel@gmail.com"
    click_button "Create Owner"

    expect(page).to have_content "Owner was created successfully"
    expect(page).to have_content "Add Owner"
  end

  scenario "After creating an owner the associate is redirected to enter another owner" do
    visit 'owners/new'
    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Dornfeld"
    fill_in "Email", with: "pdornfel@gmail.com"
    click_button "Create Owner"

    expect(page).to have_content "Owner was created successfully"
    expect(page).to have_content "Add Owner"

    current_path.should eq "/owners/new"
  end

end