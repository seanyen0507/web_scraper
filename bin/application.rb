#!/usr/bin/env ruby
# require '../lib/NBA_info/NBA_info_ex.rb'
require 'NBA_info'

sam = Scraper.new
puts "Enter 1 to see starting lineup today, enter 2 to see any player's "\
'profile you want.'

control = gets.chomp
control = control.to_i

if control == 2
  puts "Which player's profile you want to see?"
  name = gets.chomp
  name.downcase!
  name.gsub!(' ', '_')
  sean = sam.profile(name)[0]
  if sam.profile(name)[2] == false
    puts 'Player not found, please input the whole right name.'
    exit
  else
    sean.each { |key, value| puts "#{key} : #{value}" }
  end
elsif control == 1
  po = sam.game[0]
  w = sam.game[1]
  s = sam.game[2]
  po.each do |key, value|
    puts "#{key}\t#{value}\n"
    if key.include? 'PM'
      5.times { puts s.shift }
      puts "\n"
    else
      1.times { puts w.shift }
      3.times { puts s.shift }
      puts "\n"
    end
  end
end
