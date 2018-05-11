class CreateRpgs < ActiveRecord::Migration[5.2]
  def change
    create_table :rpgs do |t|
      t.text :name
      t.integer :hp
      t.integer :max_hp
      t.integer :potion
      t.text :scrawl
      t.text :enemy_name
      t.integer :enemy_hp

      t.timestamps
    end
  end
end
