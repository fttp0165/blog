class ModifyPostStatus < ActiveRecord::Migration[6.0]
  def change
    
    change_column :posts, :status,:integer 
  end
end
