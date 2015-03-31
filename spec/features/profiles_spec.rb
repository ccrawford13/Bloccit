require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Visiting profiles" do

  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @comment = create(:comment, user: @user, post: @post)
  end
  
  describe "not signed in" do
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
        click_link 'Posts'
      expect( page ).to have_content(@post.title)
        click_link 'Comments'
      expect( page ).to have_content(@comment.body)
    end
  end
end


  describe "user viewing own profile" do
    
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      @comment = create(:comment, user: @user, post: @post)
      login_as(@user, :scope => @user)
    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      click_link 'Posts'
      expect( page ).to have_content(@post.title)
      click_link "Comments"
      expect( page ).to have_content(@comment.body)
    end
  end


