require './scraper'
sam = Scraper.new
puts "Enter 1 to see starting lineup today, enter 2 to see any player's profile you want."
control = gets.chomp
control = control.to_i

if control == 1
  puts "Which player's profile you want to see?"
  name = gets.chomp
  sam.profile(name)
elsif control == 2

  sam.game()
end
