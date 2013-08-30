require 'spec_helper'

describe 'Edit comment' do
  before do
    User.create({:username => 'foo', :email => 'Person1@example.com', :password => 'password'})
    visit new_user_session_path
    fill_in 'user[email]', with: 'Person1@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
  end

  let(:commented_post) { FactoryGirl.create(:post_with_comments) }

  describe "when current_user is the comment's author" do
    it 'should edit the comment content' do
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