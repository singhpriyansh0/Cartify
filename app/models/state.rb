class State < ApplicationRecord
  belongs_to :country
  has_many :cities, class_name: "City"
end

