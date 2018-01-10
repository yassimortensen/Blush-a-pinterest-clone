class Api::V1::PictureBoardsController < ApplicationController
  before_action :set_picture_board, only: [:show, :update, :destroy]

  # GET /users
  def index
    @picture_boards = PictureBoard.all
    render json: @picture_boards
  end

  # POST /users
  def create
    @picture_board = PictureBoard.new(picture_board_params)
    if @picture_board.save
      render json: @picture_board
    else
      render json: @picture_board.errors, status: :unprocessable_entity
    end
  end

  ## GET /users/1
  def show
    render json: @picture_board
  end

  ## PATCH/PUT /users/1
  def update
    if @picture_board.update(picture_board_params)
      render json: @picture_board
    else
      render json: @picture_board.errors, status: :unprocessable_entity
    end
  end

  ##DELETE /users/1
  def destroy
    @picture_boards = PictureBoard.all
    @picture_board.destroy
    render json: @picture_boards
  end

  private

  def set_picture_board
    @picture_board = PictureBoard.find(params[:id])
  end

  def picture_board_params
    params.permit(:picture_id, :board_id)
  end
end
