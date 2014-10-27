class SearchesController < ApplicationController

  def new
   @rant = Rant.new
  end


  def show
    @search = Search.new(params[:search])
    @user = User.new
    @rant = Rant.new
  end

end