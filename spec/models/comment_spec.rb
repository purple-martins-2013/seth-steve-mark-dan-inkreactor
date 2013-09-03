require 'spec_helper'

describe Comment do

  context 'validations' do
    it { should validate_presence_of(:content) }
  end

  context 'assocations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

end
