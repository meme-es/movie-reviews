class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:name])

    if user
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to root_url, notice: "Welcome #{user.name}, you successfully logged in!"
    else
      str_alert = "Invalid user named \"#{params[:name]}\", you have to register the user first"
      str_alert = 'Name must not be empty' if params[:name].empty?

      redirect_to login_url, alert: str_alert
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
