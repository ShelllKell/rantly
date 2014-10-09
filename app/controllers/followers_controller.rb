class FollowersController < ApplicationController

  def index
    @user = session[:user_id]
    @following = Follower.where(user_id: session[:user_id])
  end

  def create
    @follower = Follower.new(user_id: session[:user_id], following: params[:ranter_id])
  end



end