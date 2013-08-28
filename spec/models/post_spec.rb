require 'spec_helper'

describe Post do 

  let(:post) { FactoryGirl.build(:post) }
  it {should validate_presence_of :subject}
  it {should validate_presence_of :content}

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
end
