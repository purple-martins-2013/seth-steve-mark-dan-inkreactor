require 'spec_helper'

describe CommentsController do

  before do
    FactoryGirl.create(:user)
    sign_in User.first
  end

  describe 'post create' do
    let(:post_to_comment_on) { FactoryGirl.create(:post) }
    let(:comment_action) { post :create, post_id: post_to_comment_on.id, comment: comment_attributes }

    context 'with valid attributes' do
      let(:comment_attributes) { FactoryGirl.attributes_for(:comment) }

      it 'creates a new comment' do
        expect { 
          comment_action
          }.to change(Comment, :count).by(1)
      end

      it "redirects to post's show page" do
        comment_action
        response.should redirect_to post_path(post_to_comment_on)
      end
    end

    context 'with invalid attributes' do
      let(:post_to_comment_on) { FactoryGirl.create(:post) }
      let(:comment_action) { post :create, post_id: post_to_comment_on.id, comment: { content: '' } }

      it 'does NOT create a new comment' do
        expect {
          comment_action
        }.to_not change(Comment, :count)
      end

      it "redirects to post's show page" do
        comment_action
        response.should redirect_to post_path(post_to_comment_on)
      end
    end
    
  end
end
