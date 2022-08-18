class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = current_user.posts.includes(:comments)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    @likes = @post.likes
    @new_comment = @post.comments.new
  end

  def new
    @user = current_user
  end
end
