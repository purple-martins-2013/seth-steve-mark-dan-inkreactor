class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_and_authorize_post, :only => [:edit, :update, :destroy]
  def index
    @posts = Post.limit(Post::PER_PAGE)  #Do we want to limit the number of posts, or paginate?
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new(post_id: @post.id)
		@tag = Tag.new
		@tag.posts << @post
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
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

  def load_and_authorize_post
    @post = Post.find_by_id(params[:id])
    redirect_to root_path unless @post.owner? current_user
  end
end
