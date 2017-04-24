class Post < ApplicationRecord
 validates :title, :sub_id, :author, presence: true

  has_many :post_subs,
  foreign_key: :post_id,
  class_name: "PostSub"

  has_many :subs,
  through: :post_subs,
  source: :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: "User"

end
