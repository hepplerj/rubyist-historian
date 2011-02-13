#!/usr/bin/ruby -w

# hellomethod.rb

# defining functon 'hello' to ask
# for parameter 'name'

def hello(name)
    'Hello ' + name
end

puts "Please enter your name: "
name = gets.chomp

puts hello(name)
