class LikecommentsController < ApplicationController
  def new
		@comment = Comment.find(params[:comment_id])
		@comment.likes.create(:user_id => current_user.id)
		@post = Post.find(params[:post_id])
		redirect_to post_path(@post)
	end	
end
