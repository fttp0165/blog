class PostComment < ApplicationRecord
      belongs_to :user
      belongs_to :post
      has_rich_text :content
      validates :content, presence: true
end
