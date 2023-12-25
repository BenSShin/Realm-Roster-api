class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :higher_level
      t.string :range
      t.text :components, array: true, default: []
      t.string :material
      t.boolean :ritual
      t.string :duration
      t.boolean :concentration
      t.string :casting_time
      t.string :level
      t.string :dc_type
      t.string :attack_type
      t.string :damage_type
      t.string :school
      t.string :classes, array: true, default: []
      t.string :subclasses, array: true, defualt: []
      t.string :url

      t.timestamps
    end
  end
end
