class CommentsController < ApplicationController


  def create
    if params[:rant_id]
      @comment =  Rant.find(params[:rant_id]).comments.build(allowed_params.merge(user_id: current_user.id))
    else
      @comment = User.find(params[:user_id]).comments.build(allowed_params.merge(user_id: current_user.id))
    end

    if @comment.save
      redirect_to :back
    else
      redirect_to :back
      flash[:notice] = "No comment for you."
    end
  end

  private

  def allowed_params
    params.require(:comment).permit(:comment)
  end
end