#WebScraper HW
>this assignment scrapes the information and parse HTML directly from websites.

##Choice of website
</br>
First, we choose the NBA sports infomation on <http://scores.espn.go.com/nba/scoreboard> and scrape each game's starting lineup.
Second, we use the NBA players website <http://origin.nba.com/players/> to scrape the players' current season stats which user enters.
##Structure of our Code
</br>
We used `Nokogiri` to parse HTML on Ruby, then used `XPATH` to find the tag on HTML.

	require 'open-uri'
	require 'nokogiri'
##Collaborator
* [seanyen0507](https://github.com/seanyen0507)
* [hsuchinwang](https://github.com/hsuchinwang)
* [poweihuang](https://github.com/poweihuang)
