class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post=Post.find(params[:post_id])
    @comment=@post.post_comments.new(comment_params)
    if current_user
    @comment.user_id=current_user.id
    else
    
    end

    if @comment.save
      flash[:notic]="留言成功"
      redirect_to @post
    else
      flash[:notic]="留言失敗"
      render 'posts/show'
    end

  end

  def destroy
    comment=PostComment.find(params[:id])
    comment.destroy
    redirect_to comment.post
  end
  
  private
  def comment_params
    params.require(:post_comment).permit(:content)
  end

  


end
