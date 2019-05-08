class AddInStockDefultToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :artist, :string
  end
end
