class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def show

  end


  private

  def post_params
    params.require(:post).permit(:subject, :content)
  end
end
