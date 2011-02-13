#!usr/bin/ruby -w

# hellomethod.rb

# defining function 'hello' to ask 
# for parameter 'name'
def hello(name)
    puts "Hello, #{name}!"
end

puts "Please enter your name: "

# get the variable and chomp
name = gets().chomp()

# print results
foo = hello(name)
