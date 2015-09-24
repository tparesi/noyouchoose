require "koala"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def push_match(match)
    plan_channel = 'matches_for_plan_' + match.plan.id.to_s
    Pusher.trigger(plan_channel, 'new_match', match.to_json({}))
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= Session.find_user(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!(user)
    @current_user = user
    @session = user.sessions.create!
    session[:session_token] = @session.token
  end
end
