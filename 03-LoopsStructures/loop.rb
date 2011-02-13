#!/usr/bin/ruby -w

# loop.rb

# ask the user for a number limit
puts "Enter a limit: "

# set the counter to 1
num = 1

# take in the user number and convert to integer (.to_i)
limit = gets().chomp().to_i()

# start the loop. Add one to the number until
# 'num' is equal to 'limit'
while (num <= limit)
    puts num
    num = num + 1
end
