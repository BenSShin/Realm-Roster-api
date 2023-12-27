class AddDefaultToCharacterGroup < ActiveRecord::Migration[7.0]
  def change
    change_column :characters, :group_id, :integer, :default => 1
  end
end
