require 'open-uri'
require 'nokogiri'

web_data = open("https://kindle.amazon.com/")
doc = Nokogiri.HTML(web_data)

people = doc.xpath("//div[@class='name']")
people.each {|followed| puts followed.text}
