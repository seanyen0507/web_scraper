require './NBA_info'
sam = Scraper.new
puts "Enter 1 to see starting lineup today, enter 2 to see any player's profile you want."
control = gets.chomp
control = control.to_i

if control == 1
  puts "Which player's profile you want to see?"
  name = gets.chomp
  name.downcase!.gsub!(' ','_')
  sean = sam.profile(name)
  sean.each {
    |key, value| puts "#{key} : #{value}"
  }
elsif control == 2
  po = sam.game
  po.each do |key, value|
    puts "#{key}\t#{value}"
    if key.include? "PM" || "AM"
      5.times { puts w.shift }
    else
      3.times { puts w.shift }
    end
  end

end
