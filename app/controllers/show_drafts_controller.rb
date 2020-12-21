class ShowDraftsController < ApplicationController
  
  def index
    @post=Post.where("user_id=? AND status=?",current_user.id,"draft")
    
  end

end
