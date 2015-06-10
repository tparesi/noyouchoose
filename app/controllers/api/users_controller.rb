class Api::UsersController < ApplicationController
  def index
      @users = User.all
      render @users
    end

    def show
      @user = User.find(params[:id])
      render @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        login_user!(@user)
        render @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    protected

    def user_params
      self.params.require(:user).permit(:provider, :uid)
    end
  end
