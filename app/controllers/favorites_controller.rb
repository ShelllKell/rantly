class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @favorite = Favorite.where(follower_id: current_user.id)
    @rant = Rant.new
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @rant = Rant.find(params[:rant_id])
    @favorite = Favorite.find(params[:user_id])
  end


  def create
    @favorite = Favorite.create!(user_id: current_user.id, rant_id: params[:user_id])
    if @favorite.save
      redirect_to :back
    end

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy!
    redirect_to :back
  end

end