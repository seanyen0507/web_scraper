require 'open-uri'
require 'nokogiri'

web_data = open('http://sports.yahoo.com/nba/')
doc = Nokogiri.HTML(web_data)
x = []
y = []

date = doc.xpath("//dd[@class='state']//em")
date.each { |followed| x << followed.text }

text = doc.xpath("//li[@class='upcoming nba basketball ']//a[@class='rapidnofollow rapid-noclick-resp']")
text.each { |followed| y << followed.text }

Highly_Followed_People = Hash[x.zip(y)]

Highly_Followed_People.each { |key, value| puts "#{key}\t#{value}" }
