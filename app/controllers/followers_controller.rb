class FollowersController < ApplicationController
before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  

  def new
    @follower = Follower.new
    @followers = Follower.all
    @users = User.all
  end

 

  def create
    @follower = Follower.new(params[:follower])
    respond_to do |format|
      if @follower.save
        format.html { redirect_to new_follower_path, notice: 'Follower was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  

  def destroy
    follower = Follower.find(params[:id])
    if follower.follower_is_current_user?(current_user)
      follower.destroy
    redirect_to new_follower_path, notice: 'now you should unfollow' 
    end
    
  end
end
