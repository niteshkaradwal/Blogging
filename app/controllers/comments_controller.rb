class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end 
  
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = @comment.post_id
  
    if Post.find(@user).user_id == current_user.id || current_user.id == @comment.commenter_id
      if @comment.status == true 
        @comment.destroy
        
        redirect_to post_path(@post)
      else
        @comments = @post.comments.all
        i=0
        @comments.each do |comment|
          @comment.destroy
          if comment.status == false
            i=1
          else
            i=0
          end
        end
        if i==0
          
          redirect_to comments_path
        else
          
          redirect_to root_path
        end  
      end 
    else
       
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
