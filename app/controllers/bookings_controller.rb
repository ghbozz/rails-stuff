class BookingsController < ApplicationController
  def create
    @stuff = Stuff.find(params[:stuff_id])
    @booking = Booking.new(booking_params.merge(stuff: @stuff, user: current_user))
    # @booking.validates_day
    if @booking.save
      redirect_to stuff_path(@booking.stuff)
    else
      render 'stuffs/show'
    end
  end

  private

  def booking_params
    params[:booking][:day] = DateTime.parse(params[:booking][:day]).strftime("%A").downcase
    params.require(:booking).permit(:day)
  end
end
