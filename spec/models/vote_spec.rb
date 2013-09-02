require "spec_helper"

describe Vote do

	context 'vote model functionality' do
		it { should validate_presence_of (:user_id) }
		it { should validate_presence_of (:post_id) }
		end

	context 'vote associations' do
		it {should belong_to(:user)}
		it {should belong_to(:post)}
	end
end