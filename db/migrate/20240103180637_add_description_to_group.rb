class AddDescriptionToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :description, :text
    remove_column :groups, :meetup
    remove_column :groups, :location
  end
end
