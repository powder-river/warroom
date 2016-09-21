class Statistics
  require 'csv'
  def initialize
  end

  def receiving
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/receiving.htm"))
    wrs = doc.xpath("//table/tbody/tr")
    CSV.open("./app/models/data/receiving.csv", "wb") do |row|
      row << ["name","team","age","pos","games","gamesStarted","targets","receptions","catchPercentage","yards","yardsPerRec","td","long","recPerGame","yardPerGame","fumbles"]
      wrs.each do |rec|[1]
        rec = rec.children
        unless rec[1].content == "Rk"
          row << [
          rec[1].content.upcase, #name
          rec[2].content, #team
          rec[3].content, #age
          rec[4].content.upcase, #position
          rec[5].content, #games
          rec[6].content, # games started
          rec[7].content, #targets
          rec[8].content, #receptions
          rec[9].content.gsub('%',""), #catch %
          rec[10].content, #yards
          rec[11].content, #yards / receptions
          rec[12].content, #TD
          rec[13].content, #long
          rec[14].content, #rec / game
          rec[15].content, #yards / game
          rec[16].content] #funbles
        end
      end
    end
  end


  def rushing
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/rushing.htm"))
    rush = doc.xpath("//table/tbody/tr")
    CSV.open("./app/models/data/rushing.csv", "wb") do |row|
      row << ["name","team","age","pos","games","gamesStarted","touches","yards","touchdowns","longRush","yardsPerCarry","yardsPerGame","touchPerGame","fumbles"]
      rush.each do |rush|[1]
        rush = rush.children
        row << [
        rush[1].content.upcase, #name
        rush[2].content, #team
        rush[3].content, #age
        rush[4].content.upcase, #position
        rush[5].content, #games
        rush[6].content, #started
        rush[7].content, #touches
        rush[8].content, #yards
        rush[9].content, #touchdowns
        rush[10].content, #longest rush
        rush[11].content, #yards per carry
        rush[12].content, #yards per game
        rush[13].content, #touches per game
        rush[25].content] #fumbles
      end
    end
  end


end
