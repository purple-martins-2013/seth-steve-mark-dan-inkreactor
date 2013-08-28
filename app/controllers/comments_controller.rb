class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params[:comment])
  end

  private

  def comment_params
    params.required(:comment).permit(:content)
  end

end
