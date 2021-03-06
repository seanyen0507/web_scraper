require 'open-uri'
require 'nokogiri'
# this is a class
class Scraper
  def game
    x, y, z, w, team_1, start_line_up, s = [], [], [], [], [], [], []
    count = 1
    @execute = true

    doc = Nokogiri.HTML(open('http://scores.espn.go.com/nba/scoreboard'))

    time = doc.xpath("//div[@class='game-status']//p")
    time.each do |times|
      if times.text == 'Final'
        x << times.text + ' ' + count.to_s
        count += 1
      else
        x << times.text
      end
    end
    team = doc.xpath("//div[@class='team-capsule']//span")
    team.each { |teams| y << teams.text }
    score = doc.xpath("//div[@class='mod-content']//ul[@class='score']\
    //li[@class='finalScore']")
    score.each { |scores| team_1 << scores.text }
    player = doc.xpath("//div[@style='display: block']\
    //table[@class='game-stat-overview']//tbody//tr//td")
    player.each { |p| start_line_up << p.text }

    (y.size / 2).times do |i|
      z << y[i * 2] + ' v.s ' + y[i * 2 + 1]
    end

    (team_1.size / 2).times do |i|
      w << team_1[i * 2] + ' v.s ' + team_1[i * 2 + 1]
    end

    (start_line_up.size / 5).times do |i|
      s << start_line_up[i * 5] + "\t" + "#{start_line_up[i * 5 + 1]} "\
      "#{start_line_up[i * 5 + 2]}" + ' v.s '  + "#{start_line_up[i * 5 + 3]} "\
      "#{start_line_up[i * 5 + 4]}"
    end

    schedule_table_upcoming = Hash[x.zip(z)]
    [schedule_table_upcoming, w, s]
  end

  def profile(name)
    f = []
    data = %w('PTS' 'REB' 'AST' 'PIE')
    web_data_player = 'http://origin.nba.com/playerfile/'
    web_data_player += name
    begin
      doc1 = Nokogiri.HTML(open(web_data_player))
    rescue
      @execute = false
    end
    profile = doc1.xpath("//div[@class='sponsor-branding']\
    //tr[@class='stats text-shadow']//td")
    profile.each { |p| f << p.text }
    player_profile = Hash[data.zip(f)]
    [player_profile, f, @execute]
  end

  def leader
    leaders = []
    doc2 = Nokogiri.HTML(open('http://espn.go.com/nba/statistics'))
    leaderscore = doc2.xpath("//div[@class='mod-content']//td[@align='right']/text()")
    leaders << leaderscore[1]
    leaders << leaderscore[19]
    leaders << leaderscore[7]
    leaders
  end
end
