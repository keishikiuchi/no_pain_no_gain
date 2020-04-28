class CreateBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :bodies do |t|
      t.string :body_weight
      t.string :body_fat
      t.string :memo
      t.integer "user_id"

      t.timestamps
    end
  end
end
