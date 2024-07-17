class CreateFilmings < ActiveRecord::Migration[7.1]
  def change
    create_table :filmings do |t|
      t.string :actor
      t.string :filming_location
      t.string :country
      t.bigint :movie_id

      t.timestamps
    end
    add_foreign_key :filmings, :movies
  end
end
