class Pet < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :likes

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
