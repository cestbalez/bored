class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.board = Board.find(params[:board_id])
    @booking.save
    # redirect to User Dashboard booking page
    # Implement also a if/else statement in case something goes wrong during booking
  end

  private

  def booking_params
    params.require(@booking).permit( :start_date, :end_date, :user_id, :board_id )
  end

end
