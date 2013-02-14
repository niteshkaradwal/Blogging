class PostsController < ApplicationController
  before_filter :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
        respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end  
  end
end
