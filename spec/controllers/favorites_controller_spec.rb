require 'rails_helper'

describe FavoritesController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    sign_in @user
  end

  describe '#create' do
    it "creates a favorite for the current user and the specified post" do
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil

      # post :create, { post_id: @post.id }
      favorite = @user.favorites.where(post: @post).create

      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
    end
  end

  describe '#destroy' do
    it "destroys the favorite for the current user and post" do
      favorite = create(:favorite, user: @user, post: @post)
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil

      favorite.destroy

      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
    end
  end
end
