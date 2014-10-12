require 'open-uri'
require 'nokogiri'

class Scraper
  web_data = open('http://scores.espn.go.com/nba/scoreboard')
  doc = Nokogiri.HTML(web_data)
  x, y, z, w = [], [], [], []
  team_1 = []

  time = doc.xpath("//div[@class='game-status']//p")
  time.each { |times| x << times.text }
  team = doc.xpath("//div[@class='team-capsule']//a")
  team.each { |teams| y << teams.text }
  player = doc.xpath("//div[@style='display: block']//table[@class='game-stat-overview']//tbody//tr//td")
  player.each { |x| team_1 << x.text }

  for i in 0..(y.size) / 2 - 1
    z << y[i * 2] + ' v.s ' + y[i * 2 + 1]
  end

  for i in 0..(team_1.size) / 5 - 1
    w << team_1[i * 5] + "\t" + "#{team_1[i * 5 + 1]} #{team_1[i * 5 + 2]}" + ' v.s ' + "#{team_1[i * 5 + 3]} #{team_1[i * 5 + 4]}"
  end
  schedule_table_upcoming = Hash[x.zip(z)]
  schedule_table_upcoming.each { |key, value| puts "#{key}\t#{value}" }
  w.each { |x| puts "#{x}" }
end
