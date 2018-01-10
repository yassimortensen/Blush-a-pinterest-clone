class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /users
  def index
    @boards = Board.all
    render json: @boards
  end

  # POST /users
  def create
    @board = Board.new(board_params)
    if @board.save
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  ## GET /users/1
  def show
    render json: @board
  end

  ## PATCH/PUT /users/1
  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  ##DELETE /users/1
  def destroy
    @boards = Board.all
    @board.destroy
    render json: @boards
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.permit(:user_id, :name)
  end
end
