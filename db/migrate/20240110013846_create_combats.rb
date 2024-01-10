class CreateCombats < ActiveRecord::Migration[7.0]
  def change
    create_table :combats do |t|
      t.integer :user_id
      t.integer :tab_id
      t.string :creature_name
      t.integer :initiative_roll
      t.integer :health
      t.string :status

      t.timestamps
    end
  end
end
