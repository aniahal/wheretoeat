class FavouritesController < ApplicationController
  before_action :find_restaurant

  def create
    unless @restaurant.favourites_by.include?(current_user)
      @restaurant.favourites_by << current_user
    end
      redirect_to @restaurant
  end

  def destroy
    like = Like.find_by!(user: current_user, restaurant: @restaurant)
    like.destroy
    redirect_to @restaurant
  end 

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end