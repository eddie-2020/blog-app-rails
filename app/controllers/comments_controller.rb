class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(
      text: comment_params,
      author_id: current_user.id,
      post_id: @post.id
    )
    new_comment.post_id = @post.id
    if new_comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Comment created successfully'
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", Alert: 'Something went wrong'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
