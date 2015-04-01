class CommentsController < ApplicationController
  
  def new
  @post = Post.find(find_post)
  @comment = Comment.new
  authorize @comment
  end

  def create
    @post = Post.find(find_post)
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    @comment.save
  end

  def destroy
    @post = Post.find(find_post)
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    @comment.destroy
     
  end

  respond_to do |format|
    format.html
    format.js
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    params[:post_id]
  end
end
