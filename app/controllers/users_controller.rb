class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)
    if @user.save
      redirect_to root_path
      flash[:notice] = "Thank you for registering. Now login to get started!"
    else
      render :new
    end

  end

  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency)
  end


end