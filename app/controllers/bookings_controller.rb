class BookingsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    @booking.board = @board
    @booking.user = current_user
    @booking.save
    authorize @booking
    redirect_to dashboard_show_path

    # Implement also a if/else statement in case something goes wrong during booking
  end

  private

  def booking_params
    params.require(:booking).permit( :start_date, :end_date, :user_id, :board_id, :price )
  end

end

