require 'rails_helper'

describe Comment do

  describe "after_create" do

    before do
      @user = create(:user)
      @post = create(:post, user: @user)
      @comment = create(:comment, user: @user, post: @post)
    end

    context "with user's permission" do

      it "sends an email to users who have favorited the post" do
        @user.favorites.where(post: @post).create

        allow( FavoriteMailer )
        .to receive(:new_comment)
        .with(@user, @post, @comment)
        .and_return( double(deliver_now: true) )

        @comment.save
      end

      it "does not send emails to users who haven't favorited the post" do
        expect( FavoriteMailer )
          .not_to receive(:new_comment)

        @comment.save
      end
    end

    context "without users permission" do
      before { @user.update_attribute(:email_favorites, false) }

      it "does not send emails, even to users who have favorited" do
        @user.favorites.where(post: @post).create

        expect( FavoriteMailer ).not_to receive(:new_comment)

        @comment.save
      end
    end
  end
end
