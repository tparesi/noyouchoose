require 'pusher'

class Api::SwipeRightsController < ApplicationController

  def create
    restaurant = PotentialRestaurant
      .where('restaurant_id = ?', swipe_right_params[:restaurant_id])
      .where('plan_id = ?', swipe_right_params[:plan_id])
      .first

    @swipe = restaurant.swipe_rights.new(user_id: current_user.id)

    if @swipe.save
      if restaurant.is_match?
        match = plan.matches.create!({ restaurant_id: restaurant.restaurant.id })
        push_match(match)
      end
      render json: @swipe
    else
      render json: @swipe.errors.full_messages
    end
  end

  private
    def swipe_right_params
      params.require(:swipe_right).permit(:plan_id, :restaurant_id)
    end

end
