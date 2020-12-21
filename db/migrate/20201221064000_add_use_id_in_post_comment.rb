class AddUseIdInPostComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :post_comments, :user
  end
end
