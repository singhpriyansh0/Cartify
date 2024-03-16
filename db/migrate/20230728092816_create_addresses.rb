class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :house_room_number
      t.string :landmark
      t.integer :pin_code
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
