class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    # adds a new post to the user's post list
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :pic_url)
  end

end
