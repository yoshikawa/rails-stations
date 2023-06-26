class DeleteColumnScreens < ActiveRecord::Migration[6.1]
  def change
    drop_table :screens do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
    end
  end
end