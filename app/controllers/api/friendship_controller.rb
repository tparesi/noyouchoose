class Api::FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.new(friend_params)
    render json: @friendship
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    unless @friendship
      @friendship = current_user
          .inverse_friendships
          .find_by(user_id: params[:id])
    end
    @friendship.destroy
    render json: @friendship
  end

  def friend_params
    params.require(:friend).permit(:friend_id)
  end
end
