require 'spec_helper'

describe 'comment show feature' do

  before do
    # REVIEW: replace with new login helper method spec/support/capybara_helper
    User.create({:username => 'foo', :email => 'Person1@example.com', :password => 'password'})
    visit new_user_session_path
    fill_in 'user[email]', with: 'Person1@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
  end

  let(:post_to_test) { FactoryGirl.create(:post) }
  let(:comment) { FactoryGirl.create(:comment, post_id: post_to_test.id) }

  it 'should show all the comments for a post' do
    visit post_path(post_to_test)
    fill_in 'comment_content', :with => 'Best comment'
    click_on 'Create Comment'
    expect(page).to have_content('Best comment')
  end
end
