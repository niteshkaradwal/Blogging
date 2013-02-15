class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @posts = Post.order("created_at desc").all
    respond_to do |format|
      format.html 
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html 
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment.update_attributes(:status => true)
    i=0
    @comments.each do |comment|
      if comment.status == false
        i=1
      end
      debugger
    end
    if i==1
      redirect_to comments_path
    else
      redirect_to root_path
    end  
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
        respond_to do |format|
        format.html { redirect_to posts_url }
      end
    end  
  end
end
