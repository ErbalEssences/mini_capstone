class CreateApiProductCatagories < ActiveRecord::Migration[5.2]
  def change
    create_table :api_product_catagories do |t|

      t.timestamps
    end
  end
end
