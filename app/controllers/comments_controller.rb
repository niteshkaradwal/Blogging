class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @posts = current_user.posts.all
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
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
  
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = @comment.post_id
  
    if Post.find(@user).user_id == current_user.id || current_user.id == @comment.commenter_id
      if @comment.status == true 
        @comment.destroy
        redirect_to post_path(@post)
      else
        i=0
        @comment.destroy
        @comments = @post.comments.all
        @comments.each do |comment|
          if comment.status == false
            i=1
            break
          else
            i=0
          end
        end
        if i==1
          redirect_to comments_path
        else
          redirect_to root_path
        end  
      end 
    end  
  end
end
