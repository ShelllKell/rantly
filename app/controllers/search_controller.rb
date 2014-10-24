class SearchController < ApplicationController

  def new
    @search = Search.new
    @rant = Rant.new
  end

  def create
    search = params[:search].gsub(' ', '_')

    redirect_to search_path
  end

  def show
    @search = Search.new(params[:id])
  end

end