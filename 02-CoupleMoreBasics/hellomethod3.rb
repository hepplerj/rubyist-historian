#!/usr/bin/ruby -w

# hellomethod3.rb

def say_hello(name)
    result = "Hello, #{name.capitalize}"
   # return result
end

puts "Enter your name: "
name = gets().chomp()

puts say_hello(name)
