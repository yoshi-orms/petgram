class Pet < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :likes
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
