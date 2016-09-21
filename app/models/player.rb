class Player < ApplicationRecord
  belongs_to :player_set

  def self.upload_player_data(fd_csv: nil, player_set: nil)
    data = CSV.foreach("fd_sample.csv" ,:headers => true, :header_converters => :symbol) do |r|
      player_set.players.create(position: r[1], firstName: r[2],lastName: r[3],fppg: r[4],
      played: r[5],salary: r[6],game: r[7],team: r[8],opponent: r[9],injury: r[10],injuryDetails: r[11])
    end
  end
  
end
