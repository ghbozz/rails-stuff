class BookingsController < ApplicationController
  def create
    @stuff = Stuff.find(params[:stuff_id])
    @booking = Booking.new(stuff: @stuff, user: current_user)
    @booking.day = DateTime.parse(params[:day]) if params[:day].present?

    if @booking.save
      redirect_to stuff_path(@booking.stuff)
    else
      render 'stuffs/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:day)
  end
end
