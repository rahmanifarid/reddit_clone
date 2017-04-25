class Post < ApplicationRecord
 validates :title, :author, presence: true

  has_many :post_subs, inverse_of: :post,
  foreign_key: :post_id,
  class_name: "PostSub"

  has_many :subs,
  through: :post_subs,
  source: :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: "User"

end
