class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.required(:comment).permit(:content)
  end

end
