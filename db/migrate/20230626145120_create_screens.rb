class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.references :sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end