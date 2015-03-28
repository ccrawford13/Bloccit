class PostsController < ApplicationController

  def show
    @topic = Topic.find(find_topic_params)
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    authorize @post
  end

  def new
    @topic = Topic.find(find_topic_params)
    @post = Post.new
    authorize @post 
  end

  def edit
    @post = Post.find(params[:id])
    @topic = @post.topic
    authorize @post 
  end

  def create
    @topic = Topic.find(find_topic_params)
    @post = current_user.posts.build(post_params)
    @post.topic = @topic 
    authorize @post 

    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved"
      redirect_to [@topic]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @topic = @post.topic
    authorize @post 

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @topic = @post.topic
    title = @post.title
    authorize @post

    if @post.destroy
      flash[:notice] = "\"#{title}\"was deleted successfully."
      redirect_to [@topic]
    else
      flash[:error] = "There was an error deleting the post."
      render :show
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
