class Review < ApplicationRecord
  belongs_to :bookmark
  validates :content, length: { minimum: 20 }
  validates :rating, numericality: { only_integer: true, in: 0..5 }
end
