class Api::SwipeRightsController < ApplicationController

  def show
  end

  def create
    restaurant = PotentialRestaurant
      .where('restaurant_id = ?', swipe_right_params[:restaurant_id])
      .where('plan_id = ?', swipe_right_params[:plan_id])
      .first

    @swipe = restaurant.swipe_rights.new(user_id: current_user.id)

    if @swipe.save
      # TODO FIX THIS LATER
      render json: {}
    else
      render json: @swipe.errors.full_messages
    end
  end

  private
    def swipe_right_params
      params.require(:swipe_right).permit(:plan_id, :restaurant_id)
    end

end
