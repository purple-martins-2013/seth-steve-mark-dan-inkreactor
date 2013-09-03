require 'spec_helper'

describe "edit post feature" do
  let!(:user) {create :user}
  #TODO This is also used in post_creation_spec.rb.  Refactor
  before do
    login user
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
