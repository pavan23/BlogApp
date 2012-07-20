class PostsController < ApplicationController


  before_filter :get_post_object, :only => [:show, :edit, :update, :destroy]

  private

  def get_post_object
    @post = Post.find_by_id(params[:id])
    if @post.nil?
      flash[:notice] = "Sorry, no post was found!"
      redirect_to posts_path
    end
  end

  public

  # the index method will serve the response for /posts route requests (GET).
  
  def index
    # this will fetch all the posts and assign the resultant array to the         instance var @posts
    # the instance variables assigned inside controllers are available directly in the views
    @posts = Post.all
  end

  # this will serve the response for /posts/id route requests (GET).
  def show
    @comment = Comment.new
  end

  # this will serve the response for /posts/id/edit route requests (GET).
  def edit
  end

  # this will serve the response for /posts/id route requests (PUT).
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post has been successfully updated."
      redirect_to post_path(@post)
    else
      render :action => :edit
    end
  end

  # this will serve the response for /posts/new route request (GET)
  def new
    @post = Post.new  # just initializing an instance variable with a new Post object.
  end

  # this will serve the response for /posts route request (POST).
  def create
    @post = Post.new(params[:post])
    if @post.save # returns true or false
      flash[:notice] = "Post has been successfully created"
      redirect_to posts_path  # redirecting to the index action
    else
      render :action => :new
    end
  end

  

  def destroy
    @post.destroy
    flash[:notice] = "Successfully deleted the post."
    redirect_to posts_path # redirecting to index page.
  end

end
