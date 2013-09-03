require 'spec_helper'

describe UsersController do

  describe '#show' do
    let(:user) { create(:user) }

    it 'should assign the correct @user' do
      get :show, { id: user.id }
      expect(assigns(:user)).to eq user
    end
  end
end
