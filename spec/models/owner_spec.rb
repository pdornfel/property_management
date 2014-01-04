require 'spec_helper'

describe Owner do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }

  it { should have_valid(:email).when('pdorn@example.com', 'launch@aol.com') }
  it { should_not have_valid(:email).when('p@com', 'pdornfe.com', '', nil) }

  it { should have_many :buildings }

end
