require 'spec_helper'

feature "user registers spot", %Q{
  As a parker
  I want to register my spot with my name
  So that the parking company can identify my car
} do
  # Acceptance Criteria:

  # * I must specify a first name, last name, email, and parking spot number
  # * I must enter a valid parking spot number (the lot has spots identified as numbers 1-60)
  # * I must enter a valid email

  scenario 'specifies valid information, registers spot' do
    prev_count = ParkingRegistration.count 
    visit '/parking_registrations/new'
    visit new_parking_registration_path
    fill_in "First name", :with => 'John'
    fill_in "Last name", :with => 'doe' 
    fill_in "Email", :with => 'user@example.com'
    fill_in "Parking spot", :with => 3
    fill_in "Parked on", :with => Date.today
    click_on 'Register'
    expect(page).to have_content 'You registered successfully'
    expect(ParkingRegistration.count).to eql(prev_count + 1)
  end
end
