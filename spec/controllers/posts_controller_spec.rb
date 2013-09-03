require 'spec_helper'

describe PostsController do

  #TODO is there a better way?
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe '#index' do
    it 'should display the first 25 posts' do
      get :index
      expect(assigns(:posts)).to eq Post.limit(Post::PER_PAGE)
    end
  end

  describe '#create' do
    let(:post_action) { post :create, post: post_attributes }

    context 'with valid attributes' do
      let(:post_attributes) { FactoryGirl.attributes_for(:post) }

      it 'creates a new post' do
        expect {
          post_action
          }.to change(Post, :count).by(1)
      end

      it "redirects to post's show page" do
        post_action
        response.should redirect_to Post.last
      end
    end

    context "with invalid attributes" do
      let(:post_attributes) { FactoryGirl.attributes_for(:post, subject: '') }

      it "does NOT create a new post" do
        expect { post_action }.to_not change(Post, :count)
      end

      it 'redirects to posts#new page' do
        post_action
        response.should redirect_to new_post_path
      end
    end
  end

  describe 'put edit' do

    before { @post = FactoryGirl.create(:post, subject: 'Change this') }

    context 'with valid attributes' do
      before { put :update, id: @post, post: FactoryGirl.attributes_for(:post) }

      it 'changes @post attributes' do
        @post.reload
        expect(@post.subject).to have_content('subject')
      end

      it 'should redirect to updated contact' do
        response.should redirect_to @post
      end
    end

    context 'with invalid attributes' do
      before do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, subject: '')
      end

      it 'does not change the @post attritbutes' do
        expect(@post.subject).to have_content('Change')
      end

      it 'does redirects to the @post edit page' do
        response.should redirect_to edit_post_path(@post)
      end
    end
  end

  describe '#new' do
    before { get :new }

    it 'should assign a new post' do
      expect(assigns(:post)).to be_a Post
    end

    it 'should render the new post form page' do
      expect(response).to render_template("new")
    end
  end

  describe '#destroy' do

    before do
      @post = FactoryGirl.create(:post, { user: user})
      delete :destroy, { id: @post.id }
    end

    it 'should delete the correct post' do
      expect(Post.find_by_id(@post.id)).to eq nil
    end

    it 'should redirect to the posts index page' do
      expect(response).to redirect_to posts_path
    end

    it 'should flash a helpful message' do
      expect(flash[:success]).to eq "Post \"#{@post.subject}\" was deleted."
    end

    describe "when trying to delete another user's post" do

      before do
        @another_user = FactoryGirl.create(:user)
        post_arguments = FactoryGirl.attributes_for(:post)
        @another_user_post = @another_user.posts.create(post_arguments)

        delete :destroy, { id: @another_user_post.id }
      end

      it 'should not delete the post' do
        expect(Post.find_by_id(@another_user_post.id)).to eq @another_user_post
      end

      it 'should return an unauthorized status code' do
        expect(response.status).to eq 401 # unauthorized
      end
    end
  end

  describe 'get show' do
    let(:post_to_comment_on) { FactoryGirl.create(:post) }
    let(:comment) { FactoryGirl.create(:comment, post_id: post_to_comment_on.id) }

    it "@comments should contain all saved comments" do
      get :show, { id: post_to_comment_on.id}
      expect(assigns(:post)).to eq(post_to_comment_on)
    end
  end
end
