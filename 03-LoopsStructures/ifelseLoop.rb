#!/usr/bin/ruby -w

# ifelseLoop.rb

puts "Enter a rating between one and five: "

#we use .to_i to convert the string to an integer
rank = gets.chomp.to_i

if rank >= 4
    puts "The book was good!"
elsif rank == 3
    puts "The book was so-so."
elsif rank<= 2
    puts "The book stinks."
end
