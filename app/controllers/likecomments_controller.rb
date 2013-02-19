class LikecommentsController < ApplicationController
  before_filter :authenticate_user!  
 
  def new
    @comment = Comment.find(params[:comment_id])
    @comment.likes.create(:user_id => current_user.id)
    @post = Post.find(params[:post_id])
    redirect_to post_path(@post)
  end 
  
  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    if current_user.id == @like.user_id
      @like.destroy
    end
    redirect_to post_path(@post)
  end
  
end
