class Post < ApplicationRecord
	include SearchPost
	validates :title, presence: true, length: { maximum: 255 }
  validates :name, length: { maximum: 255 }
  has_and_belongs_to_many :categories
end
