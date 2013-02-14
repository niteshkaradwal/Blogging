class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end 
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.status == true 
      @comment.destroy
      @post = Post.find(params[:post_id])
      redirect_to post_path(@post)
    else
      @comment.destroy
      redirect_to comments_path
    end  
  end
  
  def index
    @posts = current_user.posts.all
    
  end
  
  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.update_attributes(:status => true)
    @comments = @post.comments.all
    i=0
    @comments.each do |comment|
     
      if comment.status == false
        i=1
      end
      
     
    end
    if i==1
      redirect_to comments_path
    else
      redirect_to root_path
    end  
  end
end
