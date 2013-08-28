class PostsController < ApplicationController
  def new
  end

  def create
    Post.create(params)
  end
end
