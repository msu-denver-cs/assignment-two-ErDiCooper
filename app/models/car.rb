class Car < ApplicationRecord
  has_one :make
  has_many :parts
end
