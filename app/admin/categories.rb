ActiveAdmin.register Category do
	permit_params :name

  remove_filter :products 
	index do

    # selectable_column
    #   id_column
      column :name
      
      actions 
  end

  form do |f|
 
  
    f.inputs  :name

  f.actions        
end

 
end
