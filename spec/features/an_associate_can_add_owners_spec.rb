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

  scenario "An associate enters in all valid and required attributes with an owner"

  scenario "An associate enters in an owner without a compnay name"

  scenario "Without the required information errors are given"

  scenario "After creating an owner the associate is redirected to enter another owner"


end