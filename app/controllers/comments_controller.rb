class CommentsController < ApplicationController
  
  def new
  @post = Post.find(find_post)
  @comment = Comment.new
  authorize @comment
  end

  def create
    @post = Post.find(find_post)
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @post
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@post]
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    params[:post_id]
  end
end
