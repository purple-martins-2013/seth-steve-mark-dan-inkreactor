module CapybaraHelper
  def login user=FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
  end
end
