require 'spec_helper'

describe Comment do

  context 'comment model validations' do
    it { should validate_presence_of(:content) }
  end

  context 'comment assocations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

end
