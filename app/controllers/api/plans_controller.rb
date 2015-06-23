class Api::PlansController < ApplicationController

  def create
    @plan = PlanParser.new().parse(plan_params)
    @plan.user_ids= @plan.user_ids + [current_user.id]
    byebug
    if @plan.save
      @unswiped_restaurants = current_user.unswiped_restaurants(@plan)
      render :show
    else
      render json: @plan.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.find(params[:id])
    @unswiped_restaurants = current_user.unswiped_restaurants(@plan)
    render :show
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :time, :location, categories: [], friend_ids: [])
    end
end
