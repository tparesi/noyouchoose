class Api::PlansController < ApplicationController

  before_action :require_plan_membership, only: :show
  before_action :require_invitees, only: :create

  def create
    @plan = PlanParser.new().parse(plan_params)
    @plan.user_ids= @plan.user_ids + [current_user.id]
    if @plan.save
      @unswiped_restaurants = current_user.unswiped_restaurants(@plan)
      render :show
    else
      render json: @plan.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.find(params[:id])
    render :show
  end

  def index
    @plans = current_user.plans
    render :index
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :time, :location, categories: [], friend_ids: [])
    end

    def require_plan_membership
      unless Plan.find(params[:id]).users.include?(current_user)
        render json: 'unauthorized_page', status: 401
      end
    end

    def require_invitees
      unless plan_params[:friend_ids]
        render json: 'you must invite at least one friend', status: 422
      end
    end
end
