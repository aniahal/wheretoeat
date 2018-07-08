class ChoosingController < ApplicationController
  def choosing_restaurant
    @restaurants = Restaurant.all.sample
    redirect_to @restaurant
  end
end
