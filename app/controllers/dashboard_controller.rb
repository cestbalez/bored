class DashboardController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @my_bookings = Booking.where(user: @user)
    @board = Board.new
  end
end
