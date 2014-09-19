class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def new
    @rant = Rant.new
  end






end