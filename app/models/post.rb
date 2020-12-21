class Post < ApplicationRecord
      enum status: [ :publish, :draft ]
      validates :title, presence: true
      validates :content, presence: true
      has_rich_text :content
      has_many :post_comments
end
