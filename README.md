#WebScraper HW - NBA_info
>[![Build Status](https://travis-ci.org/seanyen0507/web_scraper.svg?branch=master)](https://travis-ci.org/seanyen0507/web_scraper)<br />This assignment scrapes the information and parse HTML directly from websites. It can help you to collect the imformation of NBA's games and players.
##Choice of website
</br>
First, we choose the NBA sports infomation on <http://scores.espn.go.com/nba/scoreboard> and scrape each game's starting lineup.
<br />
Second, we use the NBA players website <http://origin.nba.com/players/> to scrape the players' current season stats which user enters.
##Structure of our Code
</br>
We used `Nokogiri` to parse HTML on Ruby, then used `XPATH` to find the tag on HTML.

	require 'open-uri'
	require 'nokogiri'

##Usage
</br>
To run this project, you should install the gem by the following command. Then you can require the library in ruby.
	
	gem install NBA_info
	
Users can enter '1' to see the starting lineup in today's game or see the highest records(PTS, REB, STL) in the final game.<br />
Users can also enter '2' to see any players' stats in current season they enter.
##Collaborator
</br>
* [seanyen0507](https://github.com/seanyen0507)
* [hsuchinwang](https://github.com/hsuchinwang)
* [poweihuang](https://github.com/poweihuang)
