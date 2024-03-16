class Variant < ApplicationRecord
  belongs_to :product
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many_attached :images, dependent: :destroy


 #  def self.ransackable_attributes(auth_object = nil)
 #    ["colour", "created_at", "id", "material","price", "product_id", "updated_at", "weight"]
 #  end
 #  #  def self.ransackable_associations(auth_object = nil)
 #  #   ["cart_items", "order_items", "product", "roles"]
 #  # end
 # def self.ransackable_associations(auth_object = nil)
 #    ["cart_items", "images_attachments", "images_blobs", "order_items", "product", "roles"]
 #  end

end
