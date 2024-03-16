class City < ApplicationRecord
  belongs_to :state, class_name: "State"
  has_many :address
end
