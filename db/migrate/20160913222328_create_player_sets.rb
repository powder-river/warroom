class CreatePlayerSets < ActiveRecord::Migration[5.0]
  def change
    create_table :player_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
