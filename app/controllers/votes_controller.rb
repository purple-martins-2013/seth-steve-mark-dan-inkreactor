class VotesController < ApplicationController
	before_filter :authenticate_user

  def new
  	@vote = Votes.new
  end

  def create
  	post = Post.find(params[:post_id])
  	post.votes.create(:upvote => true)
  	redirect_to_post_path(post)
  end

end