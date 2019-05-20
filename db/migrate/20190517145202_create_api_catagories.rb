class CreateApiCatagories < ActiveRecord::Migration[5.2]
  def change
    create_table :api_catagories do |t|

      t.timestamps
    end
  end
end
