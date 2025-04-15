class Api::V1::CafesController < ApplicationController
  def index
    if params[:title].present?
      @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end
    render json: @cafes.order(created_at: :desc), status: :ok
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      render json: @cafe, status: :created
    else
      render json: { errors: @cafe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, criteria: [])
  end
end
