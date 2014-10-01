class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      @user = User.new(username: params[:user][:username])
       if @user[:username] = nil
        flash[:error] = "Username is required"
       elsif @user.errors[:password] = nil
         flash[:error] = "Password is required"
       # else @user.errors[:base] = nil
       #   flash[:error] = "Username / password is invalid"
       end
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end