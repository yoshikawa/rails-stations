class AddColumnScreens < ActiveRecord::Migration[6.1]
  def up
    add_column :screens, :screen_number, :integer
  end
end