require 'spec_helper'

describe TagsController do 
  let(:post_model) { FactoryGirl.create(:post_with_tags) }
	let(:tag_attributes) { FactoryGirl.attributes_for(:tag) }

	describe '#index' do
		it 'fetches all tags and assign them to @tags' do
			get :index
			expect(assigns(:tags)).to eq Tag.all
		end
	end

	describe '#new' do 
		before {
			get :new, { post_id: post_model.id }
		}

		it 'creates empty tag @tags' do
			expect(assigns(:tag).name).to be_nil
		end
		
		it "renders the new tag partial" do
			expect(response).to have_rendered(:_new)
		end
	end
  
  describe "#create" do
		before { 
			post :create, { post_id: post_model.id, tag: tag_attributes }
		}
		context "with a valid tag" do
			it "creates a tag under the post based on the attributes" do
				expect(post_model.tags.any? { |tag| tag.name == tag_attributes[:name] }).to be_true
			end
	 	end
    
		context "with an invalid tag" do
			let(:tag_attributes) { FactoryGirl.attributes_for(:invalid_tag) }
			it "does not create the tag" do
				expect(post_model.tags.none? { |tag| tag.name == tag_attributes[:name] }).to be_true
			end
		end

		context "with a tag that already exists" do	
			it "adds the tag to the post, but does not create a new tag" do
				expect(post_model.tags.any? { |tag| tag.name == tag_attributes[:name] }).to be_true
			end
    end
  end

	describe "#show" do
		before { 
			post :create, { post_id: post_model.id, tag: tag_attributes }
		}
		context "with a tag_name in the url" do
			it "fetches all posts with the provided tag" do
				expect(Tag.posts_tagged_with(tag_attributes[:name]).count).to eq 1
			end

			it "renders an index of posts for this tag" do
				pending 'unable to work with custom named route'
				get tag_path(post_model.tags.first)
				expect(response).to have_rendered('posts/index')
				#response.should render_template('posts/index')
			end
		end
	end
end
