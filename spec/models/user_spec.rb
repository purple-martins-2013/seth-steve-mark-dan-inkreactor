require 'spec_helper'

describe User do
  context "user database operations" do

    it "user should be persisted in the database" do
      new_user=User.new(username:'mark' ,email:'mark@email.com', password:'password')
      new_user.save
      new_user.should eq User.last
    end
  end

  context "user model functionality" do
    new_user=User.new(username:'mark' ,email:'mark@email.com', password:'password')

    it 'must have username' do
      bad_user=User.new(email:'mark@email.com', password:'password')
      bad_user.valid?.should eq false
      new_user.valid?.should eq true
    end

    it 'must have email' do
      bad_user=User.new(username: 'mark', password:'password')
      bad_user.valid?.should eq false
      new_user.valid?.should eq true
    end

    it 'must have password' do
      bad_user=User.new(username: 'mark',email: 'mark@gamil.com')
      bad_user.valid?.should eq false
      new_user.valid?.should eq true
    end

    it 'should refuse invalid emails' do
      bad_user1=User.new(username: 'mark', email: 'mark#gmail.com', password:'password')
       bad_user2=User.new(username: 'mark', email: 'mark@gmailcom', password:'password')
       bad_user3=User.new(username: 'mark', email: '@gmail.com', password:'password')
       bad_user1.valid?.should eq false
       bad_user2.valid?.should eq false
       bad_user3.valid?.should eq false
       new_user.valid?.should eq true
    end

    it 'should refuse passwords that are not 8 charaters or more' do
      bad_user1=User.new(username: 'mark', email: 'mark@gmail.com', password:'pass')
      bad_user1.valid?.should eq false
      new_user.valid?.should eq true
    end
  end
end
