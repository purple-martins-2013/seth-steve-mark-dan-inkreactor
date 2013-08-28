require 'spec_helper'

describe PostsController do

  describe 'GET "new"' do

    it 'renders the #new view' do
      get :new
      response.should render_template :new
    end
  end

  # describe 'GET "show"' do

  #   it 'assigns the requested post to @post' do

  #   end
  # end

  # context 'post creation'

  #   it 'redirects to the post page upon creation' do
  #     post :create
  #   end
  # end

end
