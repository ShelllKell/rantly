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
      UserMailer.welcome_email(@user).deliver
      UserMailer.confirmation_email(@user).deliver

      redirect_to root_path
      flash[:notice] = "Please check your email for a confirmation."
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


  def account_confirmation
    @user = User.find_by_token(params[:token])
    if @user
      @user.update_column(:active, true)
      redirect_to login_path
    else
      redirect_to root_path
    end
  end


  private

  def allowed_parameters
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :image, :email)
  end


end