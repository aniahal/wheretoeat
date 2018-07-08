class FavouritesController < ApplicationController
  before_action :find_restaurant, except: [:index]

  def index
    if params[:q].present?
      @restaurants = current_user.favourites_restaurants.joins(:city).where(':q = any(restaurants.tags) or restaurants.name ilike(:q) or cities.name ilike(:q)', q: params[:q])
    else
      @restaurants = current_user.favourites_restaurants
    end
  end

  def create
    unless @restaurant.favourites_by.include?(current_user)
      @restaurant.favourites_by << current_user
    end
      redirect_to @restaurant
  end

  def destroy
    favourite = Favourite.find_by!(user: current_user, restaurant: @restaurant)
    favourite.destroy
    redirect_to @restaurant
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end