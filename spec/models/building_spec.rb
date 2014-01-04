require 'spec_helper'

describe Building do

  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip_code }

  it { should have_valid(:zip_code).when('02111', '02478') }
  it { should_not have_valid(:zip_code).when(nil, '021', '11111111') }

  it { should belong_to :owner }


end
