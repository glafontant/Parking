class ParkingRegistration < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :parking_spot
  validates_presence_of :parked_on

  validates_format_of :email,
    with: /\A.+@.+\z/

  validates_inclusion_of :parking_spot, in: (1..60)
end
