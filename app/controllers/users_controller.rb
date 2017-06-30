class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    User.update(current_user.id, user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:picture)
  end
end
