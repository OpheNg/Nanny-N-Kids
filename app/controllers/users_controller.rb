class UsersController < ApplicationController
  def profile
  end

  def dashboard
  end

  def search_a_nanny
  end

  def nanny_index
  end

  def dashboarddd
    @user = User.find(params[:id])
    authorize @user
  end
end
