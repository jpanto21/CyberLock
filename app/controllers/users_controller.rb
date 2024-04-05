class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end
end
