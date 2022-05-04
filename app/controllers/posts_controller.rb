class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def show
    @user = @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end

  def create; end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
