class DashboardController < ApplicationController

  def show
    @user = current_user
    @rant = Rant.new
  end


end