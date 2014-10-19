require 'open-uri'
require 'nokogiri'

# this is a class
class Scraper
  web_data = open('http://scores.espn.go.com/nba/scoreboard')
  doc = Nokogiri.HTML(web_data)
  web_data_player = 'http://origin.nba.com/playerfile/'
  x, y, z, w ,f = [], [], [], [], []
  team_1 = []
  data = ["PTS", "REB", "AST", "PIE"]

  puts "Enter 1 to see starting lineup today, enter 2 to see any player's profile you want."
  control = gets.chomp
  control = control.to_i
  if control == 1
    puts "Which player's profile do you want to search?"
    name = gets.chomp
    name.downcase!
    web_data_player = web_data_player + name
    doc1 = Nokogiri.HTML(open(web_data_player))
    profile = doc1.xpath("//div[@class='sponsor-branding']//tr[@class='stats text-shadow']//td")
    profile.each { |profile| f << profile.text }
    player_profile = Hash[data.zip(f)]
    puts player_profile

  elsif control == 2
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
    schedule_table_upcoming.each do |key, value|
      puts "#{key}\t#{value}"
      if key.include? "PM" || "AM"
        5.times { puts w.shift }
      else
        3.times { puts w.shift }
      end
    end
  else
    puts "Please enter number 1 or 2"
  end
end
