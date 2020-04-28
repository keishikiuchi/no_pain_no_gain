class Body < ApplicationRecord
	belongs_to :user
	attachment :image
end
