class Make < ApplicationRecord
	belongs_to :car
	
	validates :name, length: { in: 4..12}
	validates :country, length { in: 2..15 }
end
