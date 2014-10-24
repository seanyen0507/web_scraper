require 'open-uri'
require 'nokogiri'
# this is a class
class Scraper


  def game
    x, y, z, w, team_1  = [], [], [], [], []

    doc = Nokogiri.HTML(open('http://scores.espn.go.com/nba/scoreboard'))

    time = doc.xpath("//div[@class='game-status']//p")
    time.each { |times| x << times.text }
    team = doc.xpath("//div[@class='team-capsule']//a")
    team.each { |teams| y << teams.text }
    player = doc.xpath("//div[@style='display: block']\
    //table[@class='game-stat-overview']//tbody//tr//td")
    player.each { |p| team_1 << p.text }

    for i in 0..(y.size) / 2 - 1
      z << y[i * 2] + ' v.s ' + y[i * 2 + 1]
    end

    for i in 0..(team_1.size) / 5 - 1
      w << team_1[i * 5] + "\t" + "#{team_1[i * 5 + 1]} #{team_1[i * 5 + 2]}" + \
      ' v.s '  + "#{team_1[i * 5 + 3]} #{team_1[i * 5 + 4]}"
    end

    schedule_table_upcoming = Hash[x.zip(z)]
    [schedule_table_upcoming, w]

  end

  def profile(name)
    f = []
    data = %w('PTS' 'REB' 'AST' 'PIE')
    web_data_player = 'http://origin.nba.com/playerfile/'
    web_data_player += name
    doc1 = Nokogiri.HTML(open(web_data_player))
    profile = doc1.xpath("//div[@class='sponsor-branding']\
    //tr[@class='stats text-shadow']//td")
    profile.each { |p| f << p.text }
    player_profile = Hash[data.zip(f)]
    [player_profile, f]
  end

end
