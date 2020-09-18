class Training < ApplicationRecord
	belongs_to :user, optional: true
	include SearchTraining
	validates :content, presence: true, length: { maximum: 255 }
	
end
