class Maintinance < ApplicationRecord
  belongs_to :car
  has_many :maintenances
end
