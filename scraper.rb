require 'open-uri'
require 'nokogiri'

web_data = open('http://scores.espn.go.com/nba/scoreboard')
doc = Nokogiri.HTML(web_data)
x,y,z = [],[],[]

time = doc.xpath("//div[@class='game-status']//p")
time.each { |times| x << times.text }
team = doc.xpath("//div[@class='team-capsule']//a")
team.each { |teams| y << teams.text }

for i in 0..(y.size)/2-1
  z << y[i*2] + " v.s " + y[i*2+1]
end

schedule_table_upcoming = Hash[x.zip(z)]
schedule_table_upcoming.each { |key, value| puts "#{key}\t#{value}" }
