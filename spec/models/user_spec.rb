require 'spec_helper'
describe User do
  context "user model functionality" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value('pass').for(:password) }
    it { should validate_presence_of(:email) }
    it { should_not allow_value("blah").for(:email) }
    it { should_not allow_value("mark#gmail.com").for(:email) }
    it { should_not allow_value("@gmail.com").for(:email) }
    it { should_not allow_value("@gmail.com").for(:email) }  #repeat
  end
  context "user database operations" do
    let(:new_user) { build :user }
    it "user should be persisted in the database" do
      expect {
        new_user.save
      }.to change(User, :count).by(1)
    end
  end

end

