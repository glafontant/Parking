class ParkingRegistrationsController < ApplicationController
  def new
    @parking_registration = ParkingRegistration.new
  end

  def create
    # binding.pry
    @parking_registration = ParkingRegistration.new(parking_registration_params)
    # binding.pry
     if @parking_registration.save
      redirect_to @parking_registration, notice: 'You registered successfully'
    else 
      render action: 'new'
     end
  end
  private
    def parking_registration_params
      params.require(:parking_registration).permit(:first_name, :last_name, :email, :parking_spot, :parked_on)
    end
end
