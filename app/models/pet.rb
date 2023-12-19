class Pet < ApplicationRecord
  attachment :image
  belongs_to :user
end
