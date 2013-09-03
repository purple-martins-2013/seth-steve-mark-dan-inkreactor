class TagsController < ApplicationController
	before_filter :load_post!, only: [:create, :new]
  def index
    @tags = Tag.all
  end

  # REVIEW: don't render posts/index, create a tags/show template that render a shared partial.
	def show
		@posts = Tag.posts_tagged_with(params[:name])
		@tag = Tag.find_by_name(params[:name])
		render 'posts/index'
	end

	def new
		@tag = @post.tags.new
		render :_new
	end

	def create
		tag = Tag.find_by_name(tag_params[:name])
		if tag
			@post.tags.push(tag)
		else
			@post.tags.create(tag_params)
		end
		redirect_to post_path(@post)
  end

	private
	def load_post!
		@post = Post.find(params[:post_id])
	end

  def tag_params
		params.require(:tag).permit([:name])
  end
end
