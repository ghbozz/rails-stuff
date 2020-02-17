class StuffsController < ApplicationController
  def index
  end

  def show
    @stuff = Stuff.find(params[:id])
    @booking = Booking.new
  end

  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params.merge(user: current_user))
    @stuff.availabilities = params[:days].select { |_, v| v == '1' }.keys

    if @stuff.save
      redirect_to stuff_path(@stuff)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def stuff_params
    params.require(:stuff).permit(:name)
  end

end
