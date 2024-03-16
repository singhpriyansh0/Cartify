class AddColumnToVariant < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :price, :decimal
  end
end
