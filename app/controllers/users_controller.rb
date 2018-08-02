class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    @user.save
  end

  private

  def params_user
    params.require(@user).permit(:username, :email, :password)
  end
end
