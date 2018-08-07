class ReviewsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @review = Review.new
    authorize @review
  end

  def create
    @board = Board.find(params[:board_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.board = @board
    @review.save
    redirect_to board_path(@board)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :board_id )
  end
end
