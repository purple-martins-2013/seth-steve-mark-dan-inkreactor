require 'spec_helper'

describe Comment do
  context 'comment database operation' do

    it "comment should persisted in the database" do
      new_comment = Comment.new(content: 'New comments')
      new_comment.save
      new_comment.should eq Comment.last
    end
  end

  context 'comment model functionality' do
    new_comment = Comment.new(content: 'New comments')
    bad_comment = Comment.new()
    it 'must have content' do
      bad_comment.valid?.should eq false
      new_comment.valid?.should eq true
    end
  end

  context 'comment assocations' do
    it 'can be created through a post' do
      p = Post.new
      p.comments.new({:content => 'A test comment'})
      p.comments.first.content.should eq 'A test comment'
    end

    it 'can be created through a user' do
      u = User.new
      u.comments.new ({:content => "A test comment"})
      u.comments.last.content.should eq "A test comment"
    end
  end

end
