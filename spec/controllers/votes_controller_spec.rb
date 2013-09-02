require 'spec_helper'

describe VotesController do
	
	before do
  	FactoryGirl.create(:user)
  	sign_in User.first
  end

  let(:post_to_vote_on) { FactoryGirl.create(:post)}
  let(:vote_attributes) { FactoryGirl.attributes_for(:upvote => true)}

end

