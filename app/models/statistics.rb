class Statistics
  require 'csv'
  def initialize
  end

  def nfl_data
    results = {}
    results[:receiving] = receiving
    results[:rushing] = rushing
    results[:passing] = passing

    File.open("./app/models/data/nfl_stats.json", "w") {|file| file.write(results.to_json)}

  end

  def receiving
    results = []
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/receiving.htm"))
    wrs = doc.xpath("//table/tbody/tr")

    wrs.each do |rec|[1]
      rec = rec.children
      unless rec[1].content == "Rk"
        player = {}
        player[:name] = rec[1].content.upcase
        player[:team] = rec[2].content #team
        player[:age] = rec[3].content #age
        player[:position] = rec[4].content.upcase #position
        player[:gamesPlayed] = rec[5].content #games
        player[:started] = rec[6].content # games started
        player[:targets] = rec[7].content #targets
        player[:receptions] = rec[8].content #receptions
        player[:catchPercentage] = rec[9].content.gsub('%',"") #catch %
        player[:catchYards] = rec[10].content #yards
        player[:yardsPerCatch] = rec[11].content #yards / receptions
        player[:receiveTouchdowns] = rec[12].content #TD
        player[:longReceive] = rec[13].content #long
        player[:catchPerGame] = rec[14].content #rec / game
        player[:receiveYardsPerGame] = rec[15].content #yards / game
        player[:receiveFumbles] = rec[16].content #funbles
        results << player
      end
    end
    results
  end


  def rushing
    results = []
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/rushing.htm"))
    rush = doc.xpath("//table/tbody/tr")

    rush.each do |rush|[1]
      rush = rush.children
      unless rush[1].content == "Rk"
        player = {}
        player[:name] = rush[1].content.upcase
        player[:team] = rush[2].content #team
        player[:age] = rush[3].content #age
        player[:position] = rush[4].content.upcase #position
        player[:gamesPlayed] = rush[5].content #games
        player[:started] = rush[6].content #started
        player[:touches] = rush[7].content #touches
        player[:rushYards] = rush[8].content #yards
        player[:rushTouchdowns] = rush[9].content #touchdowns
        player[:longRush] = rush[10].content #longest rush
        player[:yardsPerCarry] = rush[11].content #yards per carry
        player[:rushPerGame] = rush[12].content #yards per game
        player[:touchPerGame] = rush[13].content #touches per game
        player[:rushFumbles] = rush[25].content #fumbles
        results << player
      end
    end
    results
  end


  def passing
    results = []
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/passing.htm"))
    pass = doc.xpath("//table/tbody/tr")

    pass.each do |ps|[1]
      ps = ps.children
      unless ps[1].content == "Rk"
        player = {}
        player[:name] = ps[1].content.upcase
        player[:team] = ps[2].content #team
        player[:age] = ps[3].content #age
        player[:position] = ps[4].content.upcase #position
        player[:gamesPlayed] = ps[5].content #games
        player[:started] = ps[6].content #started
        player[:completions] = ps[8].content #completions
        player[:passingAttempts] = ps[9].content #attempts
        player[:completionPercent] = ps[10].content #completion percent
        player[:passYards] = ps[11].content #yards
        player[:passTouchdowns] = ps[12].content #touchdowns
        player[:passPerGame] = ps[20].content #yards per game
        results << player
      end
    end
    results
  end

end #end class
