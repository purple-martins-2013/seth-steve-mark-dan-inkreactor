require 'spec_helper'

describe PostsController do

  describe 'post create' do
    context 'with valid attributes' do

      it 'creates a new post' do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
          }.to change(Post, :count).by(1)
      end

      it "redirects to post's show page" do
        post :create, post: FactoryGirl.attributes_for(:post)
        response.should redirect_to Post.last
      end      
    end

    context "with invalid attributes" do

      it "does NOT create a new post" do
        expect { post :create, post: FactoryGirl.attributes_for(:post, subject: '')}.to_not change(Post, :count)
      end

      it 'redirects to posts#new page' do
        post :create, post: FactoryGirl.attributes_for(:post, subject: '')
        response.should redirect_to new_post_path
      end
    end
  end
end
