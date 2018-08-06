class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
     @boards = policy_scope(Board)

    if params[:query].present?
      @boards = Board.where("category ILIKE ?", "%#{params[:query]}%")
    else
      @boards = Board.where.not(latitude: nil, longitude: nil)
    end
      @markers = @boards.map do |board|
        {
          lat: board.latitude,
          lng: board.longitude#,
          # infoWindow: { content: render_to_string(partial: "/boards/map_box", locals: { flat: flat }) }
        }
      end
  end

  def show
    @board = authorize Board.find(params[:id])
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
    redirect_to dashboard_show_path
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
    params.require(:board).permit(:title, :category, :photo, :location, :description, :availability)
  end

end
