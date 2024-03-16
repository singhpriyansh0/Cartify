ActiveAdmin.register Product do
	permit_params :name, :price, :description, :brand_name , :category_id
	remove_filter :variants ,:price

	index do
  	selectable_column
  	id_column
  	column :name 
  	column :description
  	column :brand_name
    actions
	end

  form do |f|
		f.inputs do
			f.input :name
			f.input :description
			f.input :brand_name
			f.input :category
		end
		f.actions        
	end
end
