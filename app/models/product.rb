class Product < ApplicationRecord
  has_many :variants
  belongs_to :category

  # def self.ransackable_attributes(auth_object = nil)
  #   ["brand_name", "category_id", "created_at", "description", "id", "name", "updated_at"]
  # end
  # # def self.ransackable_associations(auth_object = nil)
  # #   ["category", "roles"]
  # # end
  #  def self.ransackable_associations(auth_object = nil)
  #   ["category", "roles", "variants"]
  # end


end
