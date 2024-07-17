class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.bigint :movie_id
      t.integer :stars
      t.text :review
      t.string :user

      t.timestamps
    end
    add_foreign_key :reviews, :movies	
  end
end
