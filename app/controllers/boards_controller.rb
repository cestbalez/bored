class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    @board.save
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
  end

  private

  def board_params
    params.require(@board).permit(:title, :type, :photo, :location, :description)
  end

end
