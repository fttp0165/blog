class ShowDraftsController < ApplicationController
  
  def index
    draft=1
    @post=Post.where("user_id=? AND status=?",current_user.id,draft)
  end

  def publish
    publish=0
    @post=Post.where("user_id=? AND status=?",current_user.id,publish)
  end

end
