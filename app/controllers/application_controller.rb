class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_path, alert: 'Please Sign In to be able to perform an action!' unless session[:user_id]
  end
end
