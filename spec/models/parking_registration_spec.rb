require 'spec_helper'

describe ParkingRegistration do
  it { should have_valid(:email).when(
      'user@example.com', 
      'user+2@another.com') 
  }

  it { should_not have_valid(:email).when('', nil,'foo') }

  it { should have_valid(:first_name).when('John', 'Dan') }

  it { should_not have_valid(:first_name).when('', nil,) }

  it { should have_valid(:last_name).when('Doe', 'Smith') }

  it { should_not have_valid(:last_name).when('', nil,) }

  it { should have_valid(:parking_spot).when(3, 15) }

  it { should_not have_valid(:parking_spot).when(0, nil, 61) }

  it { should have_valid(:parked_on).when(Date.today) }

  it { should_not have_valid(:parked_on).when('', nil) }
end
