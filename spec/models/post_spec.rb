require 'spec_helper'

describe Post do 

  it "has a valid factory" do
    expect(FactoryGirl.build(:post)).to be_valid
  end



end
