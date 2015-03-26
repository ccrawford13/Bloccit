class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comments = @post.comments
    authorize @comment
    authorize @post
  end

  def new
    @topic = Topic.find(find_topic_params)
    @post = Post.new
    authorize @post 
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post 
  end

  def create
    @topic = Topic.find(find_topic_params)
    @post = current_user.posts.build(post_params)
    @post.topic = @topic 
    authorize @post 

    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to [@post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post 

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def find_topic_params
    params[:topic_id]
  end
end
