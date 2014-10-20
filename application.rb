
require './NBA_info'

sam = Scraper.new
puts "Enter 1 to see starting lineup today, enter 2 to see any player's profile you want."
control = gets.chomp
control = control.to_i

if control == 2
  puts "Which player's profile you want to see?"
  name = gets.chomp
  name.downcase!
  name.gsub!(' ', '_')
  sean = sam.profile(name)[0]
  sean.each {
    |key, value| puts "#{key} : #{value}"
  }
elsif control == 1
  po = sam.game[0]
  w = sam.game[1]
  po.each do |key, value|
    puts "#{key}\t#{value}"
    if key.include? 'PM' || 'AM'
      5.times { puts w.shift }
    else
      3.times { puts w.shift }
    end
  end
end
