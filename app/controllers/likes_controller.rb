class LikesController < ApplicationController
	
	def new
		@post = Post.find(params[:post_id])
		@post.likes.create(:user_id => current_user.id)
		redirect_to post_path(@post)
	end	
end
