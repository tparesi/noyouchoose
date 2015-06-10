class PlanParser

  # params - :name, :time, :location, categories: [], friend_ids: []
  def initialize(params)
    @params = params
  end

  def parse
    @plan = Plan.new({name: @params[:name], time: @params[:time]})
    add_friends
    add_potential_restaurants
    @plan
  end

  def add_friends
    @params[:friend_ids].each do |id|
      @plan.users_plans.create(user_id: id)
    end
  end

  def potential_restaurants
    query_params = {
      term: "food",
      category_filter: @params[:categories].join(","),
      radius_filter: 3000
    }
    Yelp.client.search(@params[:location], query_params).businesses
  end

  def add_potential_restaurants
    potential_restaurants.each do |restaurant_data|
      # find or create restuarant by yelp id
      # create potential restaurants
      restaurant = Restaurant.find_or_create_by(yelp_id: restaurant_data.id)
      @plan.potential_restaurants.create(restaurant: restaurant)
    end
  end

end
