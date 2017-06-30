class UsersController < ApplicationController
  def profile
    @current_user = current_user
  end
end
