class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name, limit: 160
      t.string :year, limit: 45
      t.text :description
      t.string :image_url, limit: 150
      t.boolean :is_showing

      t.timestamps
    end
    add_index :movies, :name
  end
end
