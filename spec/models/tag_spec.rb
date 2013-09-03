require 'spec_helper'

describe Tag do
  let(:tag) {create(:tag, name: 'Foo Bar Bash')}
  context 'validations' do
		it { should validate_presence_of(:name) }
  end
  context "#to_param" do
    it 'should return a slug from a call to to_params' do
      # REVIEW lines 10 and 11 do the same thing, but rspec is pushing for the expect syntax
      #expect(tag.to_param).to eq 'foo-bar-bash'
      tag.to_param.should eq 'foo-bar-bash'
    end
  end
  context 'associations' do
    it { should have_and_belong_to_many(:posts) }
  end

end
