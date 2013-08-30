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
    it { should_not allow_value("@gmail.com").for(:email) }
  end
end

describe User do
  context "user database operations" do
    it "user should be persisted in the database" do
      new_user=User.new(username:'mark' ,email:'mark@email.com', password:'password')
      new_user.save
      expect(User.count).to eq 1
    end
  end

end
