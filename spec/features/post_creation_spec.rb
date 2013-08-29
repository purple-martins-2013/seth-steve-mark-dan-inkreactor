require 'spec_helper'

describe 'post creation feature' do

#TODO This is also used in edit_post_spec.rb.  Refactor
before do
  User.create({:username => 'foo', :email => 'Person1@example.com', :password => 'password'})
  visit new_user_session_path
  fill_in 'user[email]', with: 'Person1@example.com'
  fill_in 'user[password]', with: 'password'
  click_on 'Sign in'
end


  it 'should create a post and redirect to post page' do
    visit new_post_path
    fill_in "post[subject]", with: 'Subject'
    fill_in 'post[content]', with: 'Content'
    click_on 'Submit'

    expect(page).to have_content('Subject')
  end

end


