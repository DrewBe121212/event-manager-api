class UsersController < ApplicationController

  def register

  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :middle_name, :last_name)
  end

end
