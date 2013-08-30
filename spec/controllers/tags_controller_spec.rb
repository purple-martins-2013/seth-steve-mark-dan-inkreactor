require 'spec_helper'

describe TagsController do 
	describe '#index' do
		it 'fetch all tags and assign them to @tags' do
			get :index
			exepct(assigns(:tags)).to eq Tag.all
		end
	end
end
