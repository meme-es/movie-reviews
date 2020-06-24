class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(parameters)

    if @user.save
      redirect_to root_url, notice: 'User successfully created, login to write a review'
    else
      render :new
    end
  end

  private

  def parameters
    params.require(:user).permit(:name)
  end
end
