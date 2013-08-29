require 'spec_helper'

describe "edit post feature" do

  #TODO This is also used in post_creation_spec.rb.  Refactor
  before do
    User.create({:username => 'foo', :email => 'Person1@example.com', :password => 'password'})
    visit new_user_session_path
    fill_in 'user[email]', with: 'Person1@example.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
  end

  it 'should edit a post and redirect to post page' do
    post = Post.create({subject: 'Subject', content: 'Content', user_id: '1'})
    visit edit_post_path(post)
    fill_in 'post[subject]', with: 'Subject'
    fill_in 'post[content]', with: 'New Content'
    click_on 'Submit'

    expect(page).to have_content('New Content')
  end

end 
