class DashboardController < ApplicationController
  before_action :make_sure_user_exists

  def index
    @users = User.all
  end

  def new
    @rant = Rant.new
  end

  def show
    @rants = Rant.where.not(user_id: current_user.id).reverse
    if @rants == nil
      redirect_to dashboard_path
    end
    @rant = Rant.new
  end

end