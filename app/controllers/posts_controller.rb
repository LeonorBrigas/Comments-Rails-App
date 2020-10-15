class PostsController < ApplicationController
  def index
    @post = Post.new
    @all_posts = Post.order(created_at: :desc).all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path

  end

  private
  def post_params
    params.require(:post).permit(:comment)
  end

end
