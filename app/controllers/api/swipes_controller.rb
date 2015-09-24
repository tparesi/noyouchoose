class Api::SwipesController < ApplicationController

  def create
    restaurant = PotentialRestaurant
      .where('restaurant_id = ?', swipe_params[:restaurant_id])
      .where('plan_id = ?', swipe_params[:plan_id])
      .first


    if swipe_params[:swipe_type] == "right"
      swipe_right = true
    else
      swipe_right = false
    end

    @swipe = restaurant.swipes.new({user_id: current_user.id, swipe_right?: swipe_right})

    if @swipe.save
      if restaurant.is_match?
        match = restaurant.plan.matches.create!({ restaurant_id: restaurant.restaurant.id })
        push_match(match)
      end
      render json: @swipe
    else
      render json: @swipe.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def swipe_params
      params.require(:swipe).permit(:plan_id, :restaurant_id, :swipe_type)
    end

end
