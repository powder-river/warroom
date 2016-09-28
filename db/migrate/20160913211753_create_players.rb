class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :player_set_id
      t.string :name
      t.string :position
      t.string :age
      t.string :team
      t.integer :fppg
      t.string :started
      t.string :gamesPlayed
      t.string :salary
      t.string :game
      t.string :opponent
      t.string :injury
      t.string :injuryDetails

      #passing
      t.string :completions
      t.string :passingAttempts

      t.string :completionPercent
      t.string :passYards
      t.string :passTouchdowns
      t.string :passPerGame
      t.integer :comPerGame
      t.integer :attemptsPerGame

      #receiving
      t.string :targets
      t.string :receptions
      t.string :catchPercentage
      t.string :catchYards
      t.string :yardsPerCatch
      t.string :receiveTouchdowns
      t.string :longReceive
      t.string :catchPerGame
      t.string :receiveYardsPerGame
      t.string :receiveFumbles

      #rushing
      t.string :touches
      t.string :rushYards
      t.string :rushTouchdowns
      t.string :longRush
      t.string :yardsPerCarry
      t.string :rushPerGame
      t.string :touchPerGame
      t.string :rushFumbles

      t.integer :touchdowns



      t.timestamps
    end
  end
end
