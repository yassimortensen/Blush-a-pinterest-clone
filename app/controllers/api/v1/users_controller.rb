class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, include: [:boards]
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  ## GET /users/1
  def show
    render json: @user
  end

  ## PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  ##DELETE /users/1
  def destroy
    @users = User.all
    @user.destroy
    render json: @users
  end
  #
  # def auth
  #   byebug
  # end

  def search_users
    @user = User.where(name: params[:search_term].capitalize)
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :username, :password)
  end
end
