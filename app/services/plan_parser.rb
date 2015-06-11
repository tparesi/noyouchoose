class PlanParser

  # params - :name, :time, :location, categories: [], friend_ids: []

  def parse(params)
    @params = params
    @plan = Plan.new({name: @params[:name], time: @params[:time]})
    add_friends
    add_potential_restaurants
    @plan
  end

  # TODO - these should really be invitations, which get approved later
  def add_friends
    @params[:friend_ids].each do |id|
      @plan.users_plans.new(user_id: id)
    end
  end

  def potential_restaurants
    restaurants = []
    offset = 0;
    query_params = {
      term: "food",
      category_filter: @params[:categories].join(","),
      radius_filter: 3000,
      offset: offset
    }
    results = Yelp.client.search(@params[:location], query_params)
    total_restaurants = results.total

    while((offset + 1) * 20 < total_restaurants)
      offset = offset + 1
      restaurants.concat(results.businesses)
      query_params = {
        term: "food",
        category_filter: @params[:categories].join(","),
        radius_filter: 3000,
        offset: offset
      }

      results = Yelp.client.search(@params[:location], query_params)
    end

    restaurants
  end

  def add_potential_restaurants
    added_restaurants = Hash.new(false)

    potential_restaurants.each do |restaurant_data|
      restaurant = Restaurant.find_or_create_by(yelp_id: restaurant_data.id)
      next if added_restaurants[restaurant]
      @plan.potential_restaurants.new(restaurant: restaurant)
      added_restaurants[restaurant] = true
    end
  end

end
