class Api::RestaurantsController < ApplicationController

  def index
    query_params = {
      term: "food",
      category_filter: restaurant_params[:categories].join(","),
      radius_filter: 3000
    }
    @restaurants = Yelp.client.search(restaurant_params[:location], query_params)
    render :index
  end

  def filter
    render :form
  end

  def restaurant_params
    params.permit(:location, :format, categories:[])
  end

end
