class Post < ApplicationRecord
	belongs_to :user
	validates :exercise, presence: true
	validates :exercise,    length: { maximum: 20 }
	
end
