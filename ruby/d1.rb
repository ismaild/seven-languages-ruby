#Ruby - Day 1
puts "Replace a string"
puts "World".replace("Ruby")

puts "-"
puts "printing hello world"
puts "Hello, World"

puts "-"
puts "Index of ruby"
puts "Hello, Ruby".index("Ruby")

puts "-"
puts "Printing 10x"
10.times { puts "Ruby" }

puts "-"
puts "Printing 10x with string replacement"
(1..10).each { |n| puts "This is scentance #{n}" }

puts "-"

def check_number(player_choice, computer_choice)
  player_choice = player_choice.to_i
  if player_choice == computer_choice 
    puts "Congrats, you guessed the number #{computer_choice}"
  elsif player_choice < computer_choice
    puts "The number was too low"
  else
    puts "The Number was too high"
  end
end

puts "Pick a random number"
computer_choice = rand(10)
puts "Guess number?"
player_choice = gets

check_number(player_choice, computer_choice)