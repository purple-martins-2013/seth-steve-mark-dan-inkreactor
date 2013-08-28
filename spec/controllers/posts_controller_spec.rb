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
  end
end
