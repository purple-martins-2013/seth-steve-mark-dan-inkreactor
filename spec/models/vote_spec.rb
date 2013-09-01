require "spec_helper"

describe Vote do
	context 'vote model functionality' do
		it {should validate_presence_of (:user_id)}
		it {should validate_presence_of (:post_id)}
	end
  
end