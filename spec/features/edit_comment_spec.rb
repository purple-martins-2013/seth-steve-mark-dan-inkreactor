require 'spec_helper'

describe 'Edit comment' do
  let!(:user) {create :user}
  before do
    login user
  end

  let(:commented_post) { FactoryGirl.create(:post_with_comments) }

  describe "when current_user is the comment's author", js: true do
    it 'should edit the comment content' do
      save_and_open_page
      visit post_path(commented_post)
      within ("#comment-#{commented_post.comments.first.id}") do
        click_on "edit"
      end
      fill_in 'comment_content', with: 'No, this is the best comment'
      click_on 'Edit Comment'
      expect(page).to have_content('No, this is the best comment')
    end
  end
end
