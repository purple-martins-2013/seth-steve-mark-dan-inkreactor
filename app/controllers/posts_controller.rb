class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_path(post)
    else
      redirect_to new_post_path
    end
  end

  def show

  end


  private

  def post_params
    params.require(:post).permit(:subject, :content)
  end
end
