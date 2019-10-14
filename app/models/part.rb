class Part < ApplicationRecord
	belongs_to :car
	
	validates :name, length: { in: 2..20 }
end
