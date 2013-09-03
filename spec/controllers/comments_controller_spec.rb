require 'spec_helper'

describe CommentsController do

  before do
    sign_in create(:user)
  end

  let(:post_to_comment_on) { create(:post) }
  let(:comment_attributes) { attributes_for(:comment) }

  describe 'post create' do
    let(:comment_action) { post :create, post_id: post_to_comment_on.id, comment: comment_attributes }

    context 'with valid attributes' do
      it 'creates a new comment' do
        expect {
          comment_action
          }.to change(Comment, :count).by(1)
      end

      it "redirects to post's show page" do
        comment_action
        # REVIEW: user expect syntax
        response.should redirect_to post_path(post_to_comment_on)
      end
    end

    context 'with invalid attributes' do
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
