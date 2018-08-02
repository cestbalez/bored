class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
  end

  private

  def params_user
    params.require(@user).permit(:username, :email, :password)
  end
end
