class Player < ApplicationRecord
  belongs_to :player_set

  def self.upload_player_data(fd_csv: nil, player_set: nil)
    #load initial fanduel data
    CSV.foreach("fd_sample.csv" ,:headers => true, :header_converters => :symbol) do |r|
      player = player_set.players.create(position: r[1], name: "#{r[2].upcase} #{r[3].upcase}",fppg: r[4],
      gamesPlayed: r[5],salary: r[6],game: r[7],team: r[8],opponent: r[9],injury: r[10],injuryDetails: r[11])
    end

    #load and save game statistics
    stats = ["passing","rushing","receiving"]
    stats.each{|stat| load_player_stats(stat)}
    calculate_touchdowns(Player.where(player_set_id: player_set.id))
  end


  def self.load_player_stats(category)
    stats = Crack::JSON.parse(File.read("./app/models/data/nfl_stats.json"))

    #load stats data
    stats[category].each do |stat|
      if stat
        name = stat["name"]
        player = Player.find_by name: name
        if player
          stat.each {|k,v| player[k] = v}
          player.save
        end
      end
    end
  end

  def self.calculate_touchdowns(players)
    players.each do |player|
      player["touchdowns"] = player["passTouchdowns"].to_i + player["rushTouchdowns"].to_i + player["receiveTouchdowns"].to_i
      player.save
    end
  end


  '''
  NOTE JETS AND BILLS WERE NOT IN ThIS DATA SET
  NOT FOUND
  PASSER STATS ["RYAN FITZPATRICK", "TYROD TAYLOR", "ROBERT GRIFFIN", "EJ MANUEL"]
  RUSHER ["MATT FORTE", "LESEAN MCCOY", "RYAN FITZPATRICK", "TYROD TAYLOR", "DUKE JOHNSON", "ROBERT GRIFFIN", "BILAL POWELL", "REGGIE BUSH", "TED GINN", "EJ MANUEL", "MALCOLM BROWN", "D.J. FOSTER", "TYREEK HILL", "JOHNNY HOLTON", "RUSSELL SHEPARD", "KEITH SMITH"]
  REC ["QUINCY ENUNWA", "ODELL BECKHAM", "MARVIN JONES", "BRANDON MARSHALL", "ERIC DECKER", "LESEAN MCCOY", "STEVE SMITH", "CHARLES CLAY", "MATT FORTE", "DUKE JOHNSON", "SAMMY WATKINS", "ROBERT WOODS", "GREG SALAS", "TED GINN", "TYREEK HILL", "JALIN MARSHALL", "BILAL POWELL", "TAYLOR GABRIEL", "MIKE GILLISLEE", "MARQUISE GOODWIN", "CHRIS MOORE", "RUSSELL SHEPARD", "ARRELIOUS BENN", "MALCOLM BROWN", "D.J. FOSTER", "JOHNNY HOLTON", "JJ NELSON", "CECIL SHORTS", "KEITH SMITH"]
  '''

end
