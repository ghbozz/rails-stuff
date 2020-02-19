class BookingsController < ApplicationController
  def create
    @stuff = Stuff.find(params[:stuff_id])
    @booking = Booking.new(booking_params.merge(user: current_user))
    @booking = set_dates(@booking, params)

    # raise
    if @booking.save
      redirect_to stuff_path(@booking.stuff)
    else
      render 'stuffs/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    redirect_to stuff_path(@booking.stuff)
  end

  private

  def booking_params
    params.require(:booking).permit(:stuff_id)
  end

  def set_dates(booking, params)
    booking.start_date = params[:start_date].to_date
    booking.end_date = params[:end_date].to_date
    booking
  end

end
