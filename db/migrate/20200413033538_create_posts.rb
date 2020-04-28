class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :exercise
      t.integer :firstset_weight
      t.integer :firstset_rep
      t.integer :secondset_weight
      t.integer :secondset_rep
      t.integer :thirdset_weight
      t.integer :thirdset_rep
      t.integer :fourthset_weight
      t.integer :fourthset_rep
      t.integer :fifthset_weight
      t.integer :fifthset_rep
      t.text :training_post
      t.string :post_image

      t.timestamps
    end
  end
end
