class AddImageIdToBodies < ActiveRecord::Migration[5.2]
  def change
    add_column :bodies, :image_id, :string
  end
end
