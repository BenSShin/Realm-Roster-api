class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.string :image_url
      t.text :description
      t.string :race
      t.integer :level
      t.string :class

      t.timestamps
    end
  end
end
