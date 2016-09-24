class Player < ApplicationRecord
  belongs_to :player_set

  def self.upload_player_data(fd_csv: nil, player_set: nil)
    # stats = Crack::JSON.parse(File.read("./app/models/data/nfl_stats.json"))
    CSV.foreach("fd_sample.csv" ,:headers => true, :header_converters => :symbol) do |r|
      #fanduel
      player = player_set.players.create(position: r[1], name: "#{r[2].upcase} #{r[3].upcase}",fppg: r[4],
      gamesPlayed: r[5],salary: r[6],game: r[7],team: r[8],opponent: r[9],injury: r[10],injuryDetails: r[11])
    end
  end


  def self.load_player_stats
    found = 0
    stats = Crack::JSON.parse(File.read("./app/models/data/nfl_stats.json"))
    stats["passing"].each do |passer|
      if passer
        name = passer["name"]
        player = Player.find_by name: name
        if player
          puts "#{passer["name"]}".green
          passer.each do |k,v|
            puts "key:#{k} -- value:#{v}".red
            player[k] = v
          end
            player.save
        end

      end
    end


  end

  def stats
    stats = Crack::JSON.parse(File.read("./app/models/data/nfl_stats.json"))

  end
  '''
  NOT FOUND
  PASSER STATS ["RYAN FITZPATRICK", "TYROD TAYLOR", "ROBERT GRIFFIN", "EJ MANUEL"]
  RUSHER ["MATT FORTE", "LESEAN MCCOY", "RYAN FITZPATRICK", "TYROD TAYLOR", "DUKE JOHNSON", "ROBERT GRIFFIN", "BILAL POWELL", "REGGIE BUSH", "TED GINN", "EJ MANUEL", "MALCOLM BROWN", "D.J. FOSTER", "TYREEK HILL", "JOHNNY HOLTON", "RUSSELL SHEPARD", "KEITH SMITH"]
  REC ["QUINCY ENUNWA", "ODELL BECKHAM", "MARVIN JONES", "BRANDON MARSHALL", "ERIC DECKER", "LESEAN MCCOY", "STEVE SMITH", "CHARLES CLAY", "MATT FORTE", "DUKE JOHNSON", "SAMMY WATKINS", "ROBERT WOODS", "GREG SALAS", "TED GINN", "TYREEK HILL", "JALIN MARSHALL", "BILAL POWELL", "TAYLOR GABRIEL", "MIKE GILLISLEE", "MARQUISE GOODWIN", "CHRIS MOORE", "RUSSELL SHEPARD", "ARRELIOUS BENN", "MALCOLM BROWN", "D.J. FOSTER", "JOHNNY HOLTON", "JJ NELSON", "CECIL SHORTS", "KEITH SMITH"]
  '''

end
