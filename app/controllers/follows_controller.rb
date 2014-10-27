class FollowsController < ApplicationController

  def index
    @users = User.all
    @follows = Follow.where(follower_id: current_user.id)
    @rant = Rant.new
    @user = User.all
  end

  def show
    @user = User.all
    @follow = Follow.all
  end

  def create
    @follow = Follow.create!({follower_id: current_user.id, followee_id: params[:user_id]})
    if @follow.save
      redirect_to :back
    else
      flash[:notice] = "Nope."
      redirect_to :back
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy!
    redirect_to :back
  end

end