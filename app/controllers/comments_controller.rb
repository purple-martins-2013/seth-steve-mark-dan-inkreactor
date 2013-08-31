class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find_by_id(params[:id])
    render :json => { 
      edit_template: render_to_string(:partial => 'comments/form', 
                                      :locals => {post: @post, comment: @comment})
      }
  end

  def update
    Comment.find_by_id(params[:id]).update(comment_params)
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.required(:comment).permit(:content)
  end

end
