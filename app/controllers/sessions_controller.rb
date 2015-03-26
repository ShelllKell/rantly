class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      if @user.active == false
        flash[:error] = "Account has not been activated yet."
        redirect_to root_path
      elsif session[:user_id] = @user.id
        redirect_to dashboard_path
      end
    else
      flash[:error] = "Username/Password is invalid"
      render :new
    end

  end

  def destroy
    reset_session
    redirect_to root_path
  end


end