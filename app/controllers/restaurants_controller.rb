class RestaurantsController < ApplicationController

  def index
    query_params = {
      term: "food",
      category_filter: restaurant_params[:categories].join(","),
      radius_filter: 3000
    }
    # fail
    @restaurants = Yelp.client.search(restaurant_params[:location], query_params)
    render json: @restaurants
  end

  def filter
    render :form
  end



  def restaurant_params
    params.permit(:location, categories:[])
  end

end
