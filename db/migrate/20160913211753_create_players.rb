class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :player_set_id
      t.string :firstName
      t.string :lastName
      t.string :position
      t.string :fppg
      t.string :played
      t.string :salary
      t.string :game
      t.string :team
      t.string :opponent
      t.string :injury
      t.string :injuryDetails

      t.timestamps
    end
  end
end
