class CommentsController < ApplicationController
  def create
    @post=Post.find(params[:post_id])
    @comment=@post.post_comments.new(comment_params)
    @comment.user_id=current_user.id
    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end
  
  private
  def comment_params
    params.require(:post_comment).permit(:content)
  end

end
