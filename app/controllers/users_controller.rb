class UsersController < ApplicationController
  before_action :authenticate_user!

  private

  def params_user
    params.require(@user).permit(:username, :email, :password)
  end
end
