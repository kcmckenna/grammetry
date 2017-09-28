class CommentsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find params[:id]
    @post = current_user.posts.new(post_params)
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      redirect_to new_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      flash[:danger] = "You don't have access to that..."
      redirect_to comments_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      redirect_to edit_comment_path(@comment)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to user_path(current_user)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :title, :body)
  end
end
