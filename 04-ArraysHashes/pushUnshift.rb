#!/usr/bin/ruby -w

# pushUnshift.rb

my_array = ["Ambrose", "White", "Worster"]
 
array_new = my_array.push("Ulrich")
array_new = my_array.unshift("West")
 
puts "The array contains #{array_new.inspect}"
