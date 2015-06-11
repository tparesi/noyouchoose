class Api::PlansController < ApplicationController

  def create
    @plan = PlanParser.new().parse(plan_params)
    @plan.user_ids= @plan.user_ids + [current_user.id]
    if @plan.save
      render :show
    else
      render json: @plan.errors.full_messages, status: :unprocessable_entity
    end
  end

  # TODO - add a route to get the next page of search results...this might not
  # be super easy
  def page
  end

  def show
    @plan = Plan.find(params[:id])
    render :show
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :time, :location, categories: [], friend_ids: [])
    end
end
