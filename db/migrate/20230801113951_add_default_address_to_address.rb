class AddDefaultAddressToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :default_address, :boolean, default: false
  end
end
