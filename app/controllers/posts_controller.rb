class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.limit(25)  #Do we want to limit the number of posts, or paginate?
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    if Post.find_by_id(params[:id]).update(post_params)
      redirect_to post_path(params[:id])
    else
      redirect_to edit_post_path(params[:id])
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if post.user == current_user
      post.destroy
      flash[:success] = "Post \"#{post.subject}\" was deleted."
      redirect_to posts_path
    else
      render 'public/401', status: :unauthorized
    end
  end

  private

  def post_params
    params.require(:post).permit(:subject, :content)
  end
end
