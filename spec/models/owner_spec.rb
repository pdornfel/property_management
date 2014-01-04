require 'spec_helper'

describe Owner do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }

  it { should have_valid(:email).when('pdorn@example.com', 'launch@aol.com') }
  it { should_not have_valid(:email).when('p@com', 'pdornfe.com', '', nil) }

  context "if an owner is deleted, all associated buildings' for owner are nullified" do
    it { should have_many(:buildings).dependent(:nullify) }
  end

end
