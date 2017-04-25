class Comment < ApplicationRecord
  validates :content, :author, :post, presence: true

  belongs_to :author,
  foreign_key: :user_id,
  class_name: "User"

  belongs_to :post,
  foreign_key: :post_id,
  class_name: "Post"
end
