class AddAreaOfEffectToSpell < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :area_of_effect, :text
  end
end
