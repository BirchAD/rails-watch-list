class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :delete_all
  has_many :movies, through: :bookmarks
end
