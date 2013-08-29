require 'spec_helper'

describe PostsController do

  #TODO is there a better way?
  before do
    FactoryGirl.create(:user)
    sign_in User.first
  end

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

  describe 'put edit' do

    before { @post = FactoryGirl.create(:post, subject: 'Change this')}

    context 'with valid attributes' do

      it 'changes @post attributes' do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        @post.reload
        expect(@post.subject).to have_content('subject')
      end

      it 'should redirect to updated contact' do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        response.should redirect_to @post
      end
    end

    context 'with invalid attributes' do

      it 'does not change the @post attritbutes' do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, subject: '')
        expect(@post.subject).to have_content('Change')
      end

      it 'does redirects to the @post edit page' do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, subject: '')
        response.should redirect_to edit_post_path(@post)
      end

    end
  end
end
