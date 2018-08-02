class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = policy_scope(Board)
  end

  def show
  end

  def new
    @board = Board.new
    authorize @board
  end

  def create
    @board = Board.new(board_params)
    authorize @board
    @board.user = current_user
    @board.save
  end

  def edit
    authorize @board
  end

  def update
    authorize @board
    @board.update(board_params)
  end

  def destroy
    authorize @board
    @board.destroy
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(@board).permit(:title, :type, :photo, :location, :description)
  end

end
