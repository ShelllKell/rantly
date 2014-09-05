class SessionsController < ApplicationController
  skip_before_action :ensure_current_user


  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.find_by
  # end


end