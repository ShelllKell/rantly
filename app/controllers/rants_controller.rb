class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def show
    @rant = Rant.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.new(allowed_params)

    if @rant.save
      redirect_to dashboard_path(@user.id)
    else
      render 'dashboard/show'
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy!
    redirect_to dashboard_path
  end


  private

  def allowed_params
    params.require(:rant).permit(:topic, :rant).merge({user_id: @user.id})
  end


end