require 'spec_helper'

describe Post do 

  let(:post) { FactoryGirl.build(:post) }
  it {should validate_presence_of :subject}
  it {should validate_presence_of :content}

  it "is valid when given valid attributes" do
    expect(post).to be_valid
  end

  context 'when given valid information' do

    it 'creates a Post' do
      expect {
        post.save
      }.to change(Post, :count).by(1)
    end

  end

end
