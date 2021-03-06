class Api::UsersController < ApplicationController
  def index
      @users = current_user.friends
      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render :show
    end

    def create
      @user = User.new(user_params)
      if @user.save
        login_user!(@user)
        render json: @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    protected
    def user_params
      self.params.require(:user).permit(:provider, :uid)
    end
  end
