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
    results = {}
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/receiving.htm"))
    wrs = doc.xpath("//table/tbody/tr")

    wrs.each do |rec|[1]
      rec = rec.children
      unless rec[1].content == "Rk"
        name = rec[1].content.upcase
        player = { name => {}}
        player[name][:team] = rec[2].content #team
        player[name][:age] = rec[3].content #age
        player[name][:position] = rec[4].content.upcase #position
        player[name][:gamesPlayed] = rec[5].content #games
        player[name][:started] = rec[6].content # games started
        player[name][:targets] = rec[7].content #targets
        player[name][:receptions] = rec[8].content #receptions
        player[name][:catchPercentage] = rec[9].content.gsub('%',"") #catch %
        player[name][:catchYards] = rec[10].content #yards
        player[name][:yardsPerCatch] = rec[11].content #yards / receptions
        player[name][:receiveTouchdowns] = rec[12].content #TD
        player[name][:longReceive] = rec[13].content #long
        player[name][:catchPerGame] = rec[14].content #rec / game
        player[name][:receiveYardsPerGame] = rec[15].content #yards / game
        player[name][:receiveFumbles] = rec[16].content #funbles
        results[name] = player[name]
      end
    end
    results
  end


  def rushing
    results = {}
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/rushing.htm"))
    rush = doc.xpath("//table/tbody/tr")

    rush.each do |rush|[1]
      rush = rush.children
      unless rush[1].content == "Rk"
        name = rush[1].content.upcase
        player = { name => {}}

        player[name][:team] = rush[2].content #team
        player[name][:age] = rush[3].content #age
        player[name][:position] = rush[4].content.upcase #position
        player[name][:gamesPlayed] = rush[5].content #games
        player[name][:started] = rush[6].content #started
        player[name][:touches] = rush[7].content #touches
        player[name][:rushYards] = rush[8].content #yards
        player[name][:rushTouchdowns] = rush[9].content #touchdowns
        player[name][:longRush] = rush[10].content #longest rush
        player[name][:yardsPerCarry] = rush[11].content #yards per carry
        player[name][:rushPerGame] = rush[12].content #yards per game
        player[name][:touchPerGame] = rush[13].content #touches per game
        player[name][:rushFumbles] = rush[25].content #fumbles
        results[name] = player[name]
      end
    end
    results
  end


  def passing
    results = {}
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/passing.htm"))
    pass = doc.xpath("//table/tbody/tr")

    pass.each do |ps|[1]
      ps = ps.children
      unless ps[1].content == "Rk"
        name = ps[1].content.upcase
        player = { name => {}}

        player[name][:team] = ps[2].content #team
        player[name][:age] = ps[3].content #age
        player[name][:position] = ps[4].content.upcase #position
        player[name][:gamesPlayed] = ps[5].content #games
        player[name][:started] = ps[6].content #started
        player[name][:completions] = ps[8].content #completions
        player[name][:passingAttempts] = ps[9].content #attempts
        player[name][:completionPercent] = ps[10].content #completion percent
        player[name][:passYards] = ps[11].content #yards
        player[name][:passTouchdowns] = ps[12].content #touchdowns
        player[name][:passPerGame] = ps[20].content #yards per game
        results[name] = player[name]
      end
    end
    results
  end

end #end class
