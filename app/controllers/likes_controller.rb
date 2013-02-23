class LikesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @post = Post.find(params[:post_id])
    @post.likes.create(:user_id => current_user.id)
    
  end 
  
  def destroy
  @post = Post.find(params[:post_id])
  @like = Like.find(params[:id])
  if @like
    @like.destroy
  end
  #redirect_to post_path(@like.liker)
  end
  
end
