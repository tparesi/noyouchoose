class Api::SessionsController < ApplicationController

  def show
    if current_user
      render current_user
    else
      render json: {}
    end
  end

  def create
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    if user.nil?
      head :unprocessable_entity
    else
      login_user!(user)
      render user
    end
  end

  def destroy
    session = Session.find_by(token: session[:session_token])
    session.destroy!
    current_user = nil
    render json: {}
  end

  def omniauth
    # do something with the auth_hash
    user = User.find_or_create_by_auth_hash(auth_hash)
    login_user!(user)
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
