require 'spec_helper'

describe Post do

  let(:post) { build(:post) }

  context 'post model validations' do
    it { should validate_presence_of :subject }
    it { should validate_presence_of :content }
    # REVIEW: you can replace tests 22 and 27 with 11 and 12
    it { should allow('a' * Post::CONTENT_MAX_LENGTH).for(:content) }
    it { should_not allow('a' * Post::CONTENT_MAX_LENGTH+1).for(:content) }
  end

  context 'post associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:tags) }
  end

  context 'when given invalid data' do

    it 'is invalid if content is above 8000 characters' do
      invalid_post = build(:post, content: 'a' * Post::CONTENT_MAX_LENGTH+1)
      expect(invalid_post).to be_invalid
    end

    it 'is invalid if subject is above 50 characters' do
      invalid_post = build(:post, subject: 'a' * Post::SUBJECT_MAX_LENGTH+1)
      expect(invalid_post).to be_invalid
    end
  end

  describe 'when deleting a post' do
    it 'should delete all the comments that belonged to the post'
  end
end
