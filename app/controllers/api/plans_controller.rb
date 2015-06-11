class Api::PlansController < ApplicationController

  def create
    @plan = PlanParser.new().parse(plan_params)
    @plan.user_ids << current_user.id
    if @plan.save
      render :show
    else
      byebug
      render json: @plan.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :time, :location, categories: [], friend_ids: [])
    end
end
