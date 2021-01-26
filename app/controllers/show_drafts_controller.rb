class ShowDraftsController < ApplicationController
  
  def index
    @post=current_user.posts.where(status: :draft)
  end

  def publish
    @post=current_user.posts.where(status: :publish)
  end

end
