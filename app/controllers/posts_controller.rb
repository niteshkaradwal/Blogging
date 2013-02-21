class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @posts = Post.order_by_time.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.save
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.postOwner_is_current_user?(current_user)
      post.destroy
    redirect_to posts_path  
    end  
  end
end
