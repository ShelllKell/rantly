class SearchController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @rant = Rant.new
  end


end