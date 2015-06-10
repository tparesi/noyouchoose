class RestaurantsController < ApplicationController

  def index
    query_params = {
      term: "food",
      category_filter: restaurant_params[:categories]
    }
    fail
    @restaurants = Yelp.client.search(restaurant_params[:location], query_params)
    render json: @restaurants
  end

  def query
    render :form
  end



  def restaurant_params
    params.permit(:location, categories:[])
  end

end
