class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.boolean :save_for_later ,default: false
      t.references :cart, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key:true
      t.timestamps
    end
  end
end
