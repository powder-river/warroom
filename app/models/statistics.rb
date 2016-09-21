class Statistics
  require 'csv'
  def initialize
  end

  def wr_stats
    doc = Nokogiri::HTML(open("http://www.pro-football-reference.com/years/2016/receiving.htm"))
    wrs = doc.xpath("//table/tbody/tr")
    CSV.open("./app/models/data/wr.csv", "wb") do |row|
      row << ["name","team","age","pos","games","gamesStarted","targets","receptions","catchPercentage","yards","yardsPerRec","td","long","recPerGame","yardPerGame","fumbles"]
      wrs.each do |wr|[1]
        wr = wr.children
        unless wr[1].content == "Rk"
          row << [
          wr[1].content.upcase, #name
          wr[2].content, #team
          wr[3].content, #age
          wr[4].content.upcase, #position
          wr[5].content, #games
          wr[6].content, # games started
          wr[7].content, #targets
          wr[8].content, #receptions
          wr[9].content.gsub('%',""), #catch %
          wr[10].content, #yards
          wr[11].content, #yards / receptions
          wr[12].content, #TD
          wr[13].content, #long
          wr[14].content, #rec / game
          wr[15].content, #yards / game
          wr[16].content] #funbles
        end
      end
    end
  end
end
