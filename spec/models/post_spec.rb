require 'spec_helper'

describe Post do 

  let(:post) { FactoryGirl.build(:post) }
  
  context 'post model validations' do
    it { should validate_presence_of :subject }
    it { should validate_presence_of :content }
  end

  context 'post associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:tags) }
  end

  it "is valid when given valid attributes" do
    expect(post).to be_valid
  end

  context 'when given invalid data' do

    it 'is invalid if content is above 8000 characters' do
      invalid_post = FactoryGirl.build(:post, content: 'a' * 8001)
      expect(invalid_post).to be_invalid
    end

    it 'is invalid if subject is above 50 characters' do
      invalid_post = FactoryGirl.build(:post, subject: 'a' * 51)
      expect(invalid_post).to be_invalid
    end
  end

  describe 'when deleting a post' do
    it 'should delete all the comments that belonged to the post'
  end
end
