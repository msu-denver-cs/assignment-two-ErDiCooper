class Car < ApplicationRecord
  has_one :make
  validates_associated :make
  has_many :parts
  validates_associated :parts
  
  validates :vin, length: { is: 17}
  validates :model, length { in: 3..40}
end
