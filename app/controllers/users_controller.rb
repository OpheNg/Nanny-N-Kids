class UsersController < ApplicationController
  def profile
  end

  def dashboard
  end

  def dashboarddd
    @user = User.find(params[:id])
  end
  
end
