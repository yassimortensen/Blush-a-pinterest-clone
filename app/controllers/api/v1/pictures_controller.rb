class Api::V1::PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

  def index
    @pictures = Picture.all.shuffle
    render json: @pictures
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @picture
  end

  def update
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pictures = Picture.all
    @picture.destroy
    render json: @pictures
  end

  def get_page
    @pictures = Picture.all[(params[:page_num].to_i-1)*30, 30].shuffle
    render json: @pictures
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.permit(:url, :photographer_name, :photographer_link, :keyword)
  end

end
