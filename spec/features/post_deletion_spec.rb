require 'spec_helper'

describe 'post deletion feature' do

  #TODO This is also used in edit_post_spec.rb.  Refactor
  before do
    @user = User.create({:username => 'foo', :email => 'Person1@example.com', :password => 'password'})
    visit new_user_session_path
    fill_in 'user[email]', with: 'Person1@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
  end

  it 'should delete a post and redirect to post page' do
    post = FactoryGirl.create(:post, { user: @user })

    visit post_path(post)

    click_on 'Delete Post'

    expect(current_path).to eq posts_path
    expect(Post.exists?(post.id)).not_to be true
    expect(page).to have_content "Post \"#{post.subject}\" was deleted."
  end
end
