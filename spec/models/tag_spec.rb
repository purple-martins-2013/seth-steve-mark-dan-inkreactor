require 'spec_helper'

describe Tag do
  context 'model functionality' do
		let(:tag) {FactoryGirl.create(:tag, name: 'Foo Bar Bash')}
	
		it { should validate_presence_of(:name) }
		it 'should return a slug from a call to to_params' do
			tag.to_param.should eq 'foo-bar-bash'
		end
  end

  context 'post associations' do
    it { should have_and_belong_to_many(:posts) }
  end

end
