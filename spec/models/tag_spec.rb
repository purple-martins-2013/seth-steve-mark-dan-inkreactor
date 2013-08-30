require 'spec_helper'

describe Tag do
  context 'tag model functionality' do
    it { should validate_presence_of(:name) }
  end

  context 'post associations' do
    it { should have_and_belong_to_many(:posts) }
  end

end
