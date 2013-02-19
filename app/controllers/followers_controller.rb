class FollowersController < ApplicationController
before_filter :authenticate_user!
  
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @follower = Follower.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @follower }
    end
  end

  def new
    @follower = Follower.new
    @followers = Follower.all
    @users = User.all
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @follower = Follower.find(params[:id])
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

  def update
    @follower = Follower.find(params[:id])
    respond_to do |format|
      if @follower.update_attributes(params[:follower])
        format.html { redirect_to @follower, notice: 'Follower was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @follower = Follower.find(params[:id])
    if current_user.id == @follower.user_id
      @follower.destroy
    end
    respond_to do |format|
      format.html { redirect_to new_follower_path }
    end
  end
end
