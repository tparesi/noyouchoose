class Api::PotentialRestaurantsController < ApplicationController

  def show
    @potential_restaurant = PotentialRestaurant.find(params[:id])
    render :show
  end
end
