class LikecommentsController < ApplicationController
  def new
		@comment = Comment.find(params[:comment_id])
		@comment.likes.create(:user_id => current_user.id)
		@post = Post.find(params[:post_id])
		redirect_to post_path(@post)
	end	
	
	def destroy
		@post = Post.find(params[:post_id])
		@like = Like.find(params[:id])
		@like.destroy
		redirect_to post_path(@post)
	end
	
end
