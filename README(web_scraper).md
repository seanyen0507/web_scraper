#WebScraper HW
>this assignment scrapes the information and parse HTML directly from websites.

##Choice of website
</br>
We choose the NBA sport infomation on <http://scores.espn.go.com/nba/scoreboard> and scrape each game's starting lineup.
##Structure of our Code
</br>
We used `Nokogiri` to parse HTML on Ruby, then used `XPATH` to find the tag on HTML.

	require 'open-uri'
	require 'nokogiri'
##Collaborator
* [seanyen0507](https://github.com/seanyen0507)
* [hsuchinwang](https://github.com/hsuchinwang)
* [poweihuang](https://github.com/poweihuang)