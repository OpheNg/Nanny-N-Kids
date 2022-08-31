class UsersController < ApplicationController
  def profile
  end

  def dashboard
    @user = current_user
    authorize @user
  end

  def dashboarddd
    @user = User.find(params[:id])
    authorize @user
  end
end
