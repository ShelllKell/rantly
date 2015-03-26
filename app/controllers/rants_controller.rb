class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def show
    @show_rant = Rant.find(params[:id])
    @rant = Rant.new
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(allowed_params)

    if @rant.save
      UserMailer.follow_rant_email(current_user).deliver
      redirect_to dashboard_path(params[:user_id])
    else
      redirect_to dashboard_path
    end
  end

  def update
    @rant = Rant.find(params[:id])
    @rant.update!({spam: true})
    redirect_to dashboard_path
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy!
    redirect_to dashboard_path
  end


  private

  def allowed_params
    params.require(:rant).permit(:topic, :rant).merge({user_id: params[:user_id]})
  end


end
