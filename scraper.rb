require 'open-uri'
require 'nokogiri'

web_data = open("https://kindle.amazon.com/")
doc = Nokogiri.HTML(web_data)
Highly_Followed_People, People ,Text=[],[],[]
$x = []
$y = []
people = doc.xpath("//div[@class='name']")
people.each {|followed| $x << followed.text}

text = doc.xpath("//div[@class = 'sampleHighlight'] //div")
text.each {|followed| $y << followed.text.gsub("\n","").gsub(" ","")}


for i in 0..2
  Highly_Followed_People << Hash[$x[i],$y[i]]
end
Highly_Followed_People.each {|key,value| puts "#{key}" }
#puts people "\t" text
