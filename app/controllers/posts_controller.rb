class PostsController < ApplicationController
  def create
    Post.create(params)
  end
end
