class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :update, :edit]
  def index
    if params[:q].present?
      @restaurants = Restaurant.joins(:city).where(':q = any(restaurants.tags) or restaurants.name ilike(:q) or cities.name ilike(:q)', q: params[:q])
    else
      @restaurants = Restaurant.all
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :street, :city_id, :tags, :image)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
