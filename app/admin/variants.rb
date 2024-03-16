ActiveAdmin.register Variant do
	permit_params :colour, :weight, :material, :product_id ,:price , images: []

	remove_filter :colour



	

form do |f|
  f.inputs do
  	f.input :product_id, as: :select, collection: Product.all
  	f.input :colour
  	f.input :weight
  	f.input :material
  	f.input :price
    f.input :images, as: :file, input_html: { multiple: true }
  end
  f.actions
end
end