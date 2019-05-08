class RemoveArtistFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :artist, :string
  end
end
