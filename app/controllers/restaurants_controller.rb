class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :create]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end
end
