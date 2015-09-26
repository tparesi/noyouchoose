class Api::PlansController < ApplicationController

  before_action :require_plan_membership, only: :show
  before_action :require_invitees, :require_cuisines, :require_location, only: :create

  def create
    @plan = PlanParser.new().parse(plan_params)
    @plan.user_ids= @plan.user_ids + [current_user.id]
    if @plan.save
      @unswiped_restaurants = @plan.unswiped_restaurants(current_user)
      render :show
    else
      render json: @plan.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.includes(:users).find(params[:id])
    render :show
  end

  def index
    @plans = current_user.plans
    render :index
  end

  def matches
    @matches = Plan.find(params[:id]).matches
    render :matches
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
        render json: ['you must invite at least one friend'], status: 422
      end
    end

    def require_cuisines
      unless plan_params[:categories]
        render json: ['you must specify at least one cuisine'], status: 422
      end
    end

    def require_location
      if plan_params[:location].empty?
        render json: ['you must specify a location'], status: 422
      end
    end
end
