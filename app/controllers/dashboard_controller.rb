class DashboardController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @rant = Rant.new
  end

  def show
    @users = User.all
    @user = current_user
    @rant = Rant.new
    @rants = Rant.includes(:rants)
  end



end