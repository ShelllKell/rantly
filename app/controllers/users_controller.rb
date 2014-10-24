class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @rants = Rant.where(:user_id => @user.id).order(favorite_count: :desc)
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

  def edit
    @rant = Rant.new
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(allowed_parameters)
    redirect_to dashboard_path(@user)
  end


  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :avatar)
  end


end