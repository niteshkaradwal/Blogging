class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @posts = current_user.posts
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
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
    comment = Comment.find(params[:id])
    post = comment.post_id
    
  
    if comment.commenter_is_current_user?(current_user) || comment.post.postOwner_is_current_user?(current_user)  
      if comment.status == true 
        comment.destroy
        redirect_to post_path(comment.post_id)
      else
        comment.destroy
        if Comment.where("post_id = ? AND status = ?", post, false).present?
   
          redirect_to comments_path
        else
          redirect_to root_path
        end  
      end 
    end  
  end
end
