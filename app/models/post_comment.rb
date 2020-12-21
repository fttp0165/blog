class PostComment < ApplicationRecord
      belongs_to :user
      belongs_to :post
      has_rich_text :content
      validates :content, presence: true
      validates :post_id, presence: true
end
