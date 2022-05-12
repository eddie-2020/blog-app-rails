class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts.includes(:comments)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.author
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to "/users/#{@post.author.id}/posts/", flash: { alert: 'Post Saved Successfully' }
        else
          render :new, alert: 'Sorry, something went wrong'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
