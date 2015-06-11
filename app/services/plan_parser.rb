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
    # query_params = {
    #   term: "food",
    #   category_filter: @params[:categories].join(","),
    #   radius_filter: 3000
    # }
    # Yelp.client.search(@params[:location], query_params).businesses
    results = []
    @params[:categories].each do |category|
      query_params = {
        term: "food",
        category_filter: category,
        radius_filter: 3000
      }
      results.concat(Yelp.client.search(@params[:location], query_params).businesses)
    end

    results
  end

  def add_potential_restaurants
    already_added = Hash.new(false)
    potential_restaurants.each do |restaurant_data|
      restaurant = Restaurant.find_or_create_by(yelp_id: restaurant_data.id)
      @plan.potential_restaurants.new(restaurant: restaurant) unless already_added[restaurant]
      already_added[restaurant] = true
    end
  end

end
