require 'spec_helper'
# REVIEW: this is an empty test.
describe VotesController do

	before do
  	sign_in create(:user)
  end

  let(:post_to_vote_on) { FactoryGirl.create(:post)}
  let(:vote_attributes) { FactoryGirl.attributes_for(:upvote => true)}

end

